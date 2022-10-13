//
//  MenuView.swift
//  FoodStore
//
//  Created by Egor SAUSHKIN on 13.10.2022.
//

import UIKit

protocol MenuViewDelegateProtocol: AnyObject {
    func tableHeightUpdate(newHeight: CGFloat)
}

class MenuView: UIViewController {
    
//    weak var menuViewDelegate: MenuViewDelegateProtocol?
    
    private lazy var tableView: MenuTableView = {
        let tableView = MenuTableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView(){
        self.view.backgroundColor = .white
        self.view.addSubview(self.tableView)

        let topTableConstraint = self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor)
        let leadingTableConstraint = self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        let trailingTableConstraint = self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        let bottomTableConstraint = self.tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        
        NSLayoutConstraint.activate([
                                     topTableConstraint,
                                     leadingTableConstraint,
                                     trailingTableConstraint,
                                     bottomTableConstraint
                                    ])
    }
}

