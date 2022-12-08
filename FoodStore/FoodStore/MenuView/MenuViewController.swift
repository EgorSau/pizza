//
//  MenuView.swift
//  FoodStore
//
//  Created by Egor SAUSHKIN on 13.10.2022.
//

import UIKit

final class MenuViewController: UIViewController {
    
    // MARK: Private Properties
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(MenuTableViewCell.self, forCellReuseIdentifier: "DefaultCellId")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "DefaultCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    var mock: [Section: Any] = [:]
    var selectedCategory = "Пицца"
    
    // MARK: Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mock = Mock.shared.createMockData()
        self.setupView()
        self.barSetup(withTitle: "Выберете город")
    }
    
    // MARK: Private
    
    private func setupView(){
        self.view.backgroundColor = .white
        
        self.view.addSubview(self.tableView)
        
        let topTableConstraint = self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor)
        let leadingTableConstraint = self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        let trailingTableConstraint = self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        let bottomTableConstraint = self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        
        NSLayoutConstraint.activate([
            topTableConstraint,
            leadingTableConstraint,
            trailingTableConstraint,
            bottomTableConstraint
        ])
    }
}

// MARK: - CategoryHeaderViewDelegate

extension MenuViewController: CategoryHeaderViewDelegate {
    func didSelectNewCategory(_ newSelectedCategory: String) {
        self.selectedCategory = newSelectedCategory
        for row in 0...3 {
            self.tableView.reloadRows(at: [IndexPath(row: row, section: 1)], with: .fade)
        }
    }
}
