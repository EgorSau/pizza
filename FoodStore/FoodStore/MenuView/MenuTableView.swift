//
//  MenuTableView.swift
//  FoodStore
//
//  Created by Egor SAUSHKIN on 13.10.2022.
//

import UIKit

class MenuTableView: UIView {
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(MenuTableViewCell.self, forCellReuseIdentifier: "MenuCell")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "DefaultCell")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44
        return tableView
    }()
    
    var height: CGFloat = 270
    var dataSource: [PostModel] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupTableView()
        self.loadDataToDataSource(fromModel: Presenter())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadDataToDataSource(fromModel: Presenter){
        fromModel.addPostsIntoArray()
        self.dataSource = fromModel.postArray
    }
    
    private func setupTableView() {
        
        self.addSubview(self.tableView)
        
        let topConstraint = self.tableView.topAnchor.constraint(equalTo: self.topAnchor)
        let leadingConstraint = self.tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor)
        let trailingConstraint = self.tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        let bottomConstraint = self.tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        
        NSLayoutConstraint.activate([topConstraint,
                                     leadingConstraint,
                                     trailingConstraint,
                                     bottomConstraint
                                    ])
        
    }
}

extension MenuTableView: MenuViewDelegateProtocol {
    
    func tableHeightUpdate(newHeight: CGFloat) {
        UIView.animate(withDuration: 0.3, delay: 0.0) {
            self.tableView.beginUpdates()
            self.height = newHeight
            self.tableView.endUpdates()
            self.layoutIfNeeded()
        }
    }
}

extension MenuTableView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = self.dataSource.count
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath) as? MenuTableViewCell else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DefaultCell", for: indexPath)
            return cell
        }
        
        let post = self.dataSource[indexPath.row]
        let viewModel = MenuTableViewCell.ViewModel(image: post.image,
                                                    title: post.title,
                                                    description: post.description,
                                                    price: post.price)

        cell.setup(with: viewModel)
        return cell
    }
    
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return self.height
//    }

//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let menuView = MenuView()
//        menuView.menuViewDelegate = self
//        return menuView.view
//    }
}
