//
//  TabBarController.swift
//  FoodStore
//
//  Created by Egor SAUSHKIN on 13.10.2022.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .brown
        enum Index {
            case none
            case first
            case second
            case third
            case forth
            
            var title: String? {
                switch self {
                case .none:
                    return nil
                case .first:
                    return "Меню"
                case .second:
                    return "Контакты"
                case .third:
                    return "Профиль"
                case .forth:
                    return "Корзина"
                }
            }
            var image: String {
                switch self {
                case .none:
                    return ""
                case .first:
                    return "testMenu"
                case .second:
                    return "contacts"
                case .third:
                    return "profile"
                case .forth:
                    return "basket"
                }
            }
        }

        var arrayVC: [UIViewController] = [MenuViewController(), ContactsView(), ProfileView(), BasketView()]
        
        arrayVC[0] = UINavigationController(rootViewController: MenuViewController())
        arrayVC[1] = UINavigationController(rootViewController: ContactsView())
        arrayVC[2] = UINavigationController(rootViewController: ProfileView())
        arrayVC[3] = UINavigationController(rootViewController: BasketView())
        
        self.viewControllers = arrayVC.map({ tabBarItem in
            switch tabBarItem {
            case MenuViewController():
                return UINavigationController(rootViewController: MenuViewController())
            case ContactsView():
                return ContactsView()
            case ProfileView():
                return ProfileView()
            case BasketView():
                return BasketView()
            default:
                break
            }
            return tabBarItem
        })
        
        arrayVC.enumerated().forEach({ (index, viewController) in
            switch index {
            case 0:
                viewController.tabBarItem.image = UIImage (named: Index.first.image)
                viewController.tabBarItem.title = Index.first.title
                viewController.tabBarController?.tabBar.tintColor = UIColor(red: 0.992, green: 0.227, blue: 0.412, alpha: 1)
            case 1:
                viewController.tabBarItem.image = UIImage(named: Index.second.image)
                viewController.tabBarItem.title = Index.second.title
            case 2:
                viewController.tabBarItem.image = UIImage(named: Index.third.image)
                viewController.tabBarItem.title = Index.third.title
            case 3:
                viewController.tabBarItem.image = UIImage(named: Index.forth.image)
                viewController.tabBarItem.title = Index.forth.title
            default:
                viewController.tabBarItem.title = Index.none.title
            }
        })
    }
}
