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
                    Pizza(image: "pizza1", title: "Ветчина и грибы", description: "Ветчина,шампиньоны, увеличинная порция моцареллы, томатный соус", price: 350),
                    Pizza(image: "pizza2", title: "Баварские колбаски", description: "Баварски колбаски,ветчина, пикантная пепперони, острая чоризо, моцарелла, томатный соус", price: 350),
                    Pizza(image: "pizza3", title: "Нежный лосось", description: "Лосось, томаты черри, моцарелла, соус песто", price: 350),
                    Pizza(image: "pizza4", title: "Пицца четыре сыра", description: "Соус Карбонара, Сыр Моцарелла, Сыр Пармезан, Сыр Роккфорти, Сыр Чеддер (тёртый)", price: 350),
                ],
                Category(name: "Комбо", priority: 2, isSelected: false): [
                    Combo(image: "combo1", title: "1", description: nil, price: 1),
                    Combo(image: "combo2", title: "2", description: nil, price: 2),
                    Combo(image: "combo3", title: "3", description: nil, price: 3),
                    Combo(image: "combo4", title: "4", description: nil, price: 4),
                ],
                Category(name: "Десерты", priority: 3, isSelected: false): [
                    Desert(image: "1", title: "1", description: nil, price: 1),
                    Desert(image: "2", title: "2", description: nil, price: 2),
                    Desert(image: "3", title: "3", description: nil, price: 3),
                    Desert(image: "4", title: "4", description: nil, price: 4),
                ],
            ]
        ]
    }
}
