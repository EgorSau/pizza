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
    
    private lazy var topView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
//    var height: CGFloat = 168
    var height: CGFloat = 50
    var dataSource: [PostModel] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupTableView()
//        self.setupTopView()
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
    
    private func setupTopView() {
        
//        guard let bannerView = BannersCollection().view else { return }
        guard let categoryView = CategoriesCollection().view else { return }
        
        self.addSubview(self.topView)
//        self.topView.addSubview(bannerView)
        self.topView.addSubview(categoryView)
        
        let topConstraint = self.topView.topAnchor.constraint(equalTo: self.tableView.topAnchor)
        let leadingConstraint = self.topView.leadingAnchor.constraint(equalTo: self.tableView.leadingAnchor)
        let trailingConstraint = self.topView.trailingAnchor.constraint(equalTo: self.tableView.trailingAnchor)
//        let bottomConstraint = self.topView.bottomAnchor.constraint(equalTo: self.tableView.bottomAnchor, constant: 1400)
        let height = self.topView.heightAnchor.constraint(equalToConstant: self.height)
        
//        let bannerTop = bannerView.topAnchor.constraint(equalTo: self.topView.topAnchor)
//        let bannerHeight = bannerView.heightAnchor.constraint(equalToConstant: 112)
        let categoryHeight = categoryView.heightAnchor.constraint(equalToConstant: 32)
//        let categoryTop = categoryView.topAnchor.constraint(equalTo: bannerView.bottomAnchor)
        
        NSLayoutConstraint.activate([
                                    topConstraint,
                                    leadingConstraint,
                                    trailingConstraint,
//                                    bottomConstraint,
                                    height,
//                                    bannerTop,
//                                    bannerHeight,
                                    categoryHeight,
//                                    categoryTop
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
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return self.height
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

//        menuView.menuViewDelegate = self
//        return self.topView
//        return BannersCollection().view
        return CategoriesCollection().view
    }
}
