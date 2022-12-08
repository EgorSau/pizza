//
//  UIViewController+extensions.swift
//  FoodStore
//
//  Created by Саидов Тимур on 25.11.2022.
//

import UIKit

//MARK: - BarButtonItem Setup

extension MenuViewController {
    
    func barSetup(withTitle: String) {
        self.navigationItem.setLeftBarButtonItems(createCustomButton(withTitle: withTitle), animated: true)
    }
    
    private func createCustomButton(withTitle: String) -> [UIBarButtonItem] {
        let button = UIButton(type: .system)
        button.setTitle(withTitle, for: .normal)
        button.titleLabel?.font = UIFont(name: "SF UI Display", size: 17)
        button.tintColor = .black
        
        let menuBarItem = UIBarButtonItem(image: UIImage(systemName: "chevron.down"), menu: menuItems())
        menuBarItem.tintColor = .black
        
        let cityBarItem = UIBarButtonItem(customView: button)
        
        return [menuBarItem, cityBarItem]
    }
                                             
    private func menuItems() -> UIMenu {
         let moscow = UIAction(title: "Москва") { _ in
             self.barSetup(withTitle: "Москва")
         }
         let stPete = UIAction(title: "Санкт-Петербург") { _ in
             self.barSetup(withTitle: "Санкт-Петербург")
         }
         let kazan = UIAction(title: "Казань") { _ in
             self.barSetup(withTitle: "Казань")
         }
         let menu = UIMenu(title: "Город",
                           children: [moscow, stPete, kazan])
     return menu
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
