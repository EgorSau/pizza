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
    
    private var mock: [Section: Any] = [:]
    private var selectedCategory = "Пицца"
    
    // MARK: Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mock = Mock.shared.createMockData()
        self.setupView()
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


// MARK: - UITableViewDataSource, UITableViewDelegate
extension MenuViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        self.mock.keys.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return (self.mock[.banner] as? [[PromoBanner]])?.count ?? 0
        case 1:
            guard
                let selectedCategory = (self.mock[.category] as? [Category: [Food]])?.keys.first(where: { $0.isSelected }),
                let food = (self.mock[.category] as? [Category: [Food]])?[selectedCategory]
            else {
                return 0
            }
            
            return food.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "DefaultCell", for: indexPath)
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "DefaultCellId", for: indexPath) as? MenuTableViewCell else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "DefaultCell", for: indexPath)
                return cell
            }
            guard let category = self.mock[.category] as? [Category:[Food]] else { return cell }
            category.forEach { key, value in
                if key.name == self.selectedCategory {
                    cell.setup(with: value[indexPath.row])
                }
            }
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "DefaultCellId", for: indexPath)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch section {
        case 0:
            return BannersCollection()
        case 1:
            let collection = CategoriesCollection()
            collection.delegate = self
            var categoryArray = [Category]()
            guard let category = self.mock[.category] as? [Category:[Food]] else { return UIView() }
            category.forEach { key, value in
                categoryArray.append(key)
            }
            collection.setup(withCategories: categoryArray)
            return collection
        default:
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            return 112
        case 1:
            return 80
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 0
        case 1:
            return 180
        default:
            return 0
        }
    }
}

extension MenuViewController: CategoryHeaderViewDelegate {
    func didSelectNewCategory(_ newSelectedCategory: String) {
        self.selectedCategory = newSelectedCategory
        for row in 0...3 {
            self.tableView.reloadRows(at: [IndexPath(row: row, section: 1)], with: .fade)
        }
    }
}
