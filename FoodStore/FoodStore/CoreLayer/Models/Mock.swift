//
//  Presenter.swift
//  FoodStore
//
//  Created by Egor SAUSHKIN on 13.10.2022.
//

import UIKit

enum Section {
    case banner
    case category
}

struct Mock {
    
    static let shared = Mock()
    
    private init() {}
    
    func createMockData() -> [Section: Any] {
        [
            .banner: [
                [
                    PromoBanner(image: Data()),
                    PromoBanner(image: Data()),
                    PromoBanner(image: Data())
                ]
            ],
            .category: [
                Category(name: "Пицца", priority: 1, isSelected: true): [
                    Pizza(image: "1", title: "1", description: nil, price: 1),
                    Pizza(image: "2", title: "2", description: nil, price: 2),
                    Pizza(image: "3", title: "3", description: nil, price: 3),
                    Pizza(image: "4", title: "4", description: nil, price: 4),
                ],
                Category(name: "Напитки", priority: 2, isSelected: false): [
                    Drink(image: "1", title: "1", description: nil, price: 1),
                    Drink(image: "2", title: "2", description: nil, price: 2),
                    Drink(image: "3", title: "3", description: nil, price: 3),
                    Drink(image: "4", title: "4", description: nil, price: 4),
                ],
                Category(name: "Соусы", priority: 3, isSelected: false): [
                    Sauce(image: "1", title: "1", description: nil, price: 1),
                    Sauce(image: "2", title: "2", description: nil, price: 2),
                    Sauce(image: "3", title: "3", description: nil, price: 3),
                    Sauce(image: "4", title: "4", description: nil, price: 4),
                ],
            ]
        ]
    }
}
