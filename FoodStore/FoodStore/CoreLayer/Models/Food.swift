//
//  PostModel.swift
//  FoodStore
//
//  Created by Egor SAUSHKIN on 13.10.2022.
//

import UIKit

protocol Food {
    var image: String { get }
    var title: String { get }
    var description: String? { get }
    var price: Int { get }
}

struct Pizza: Food {
    let image: String
    let title: String
    let description: String?
    let price: Int
}

struct Drink: Food {
    let image: String
    let title: String
    let description: String?
    let price: Int
}

struct Combo: Food {
    let image: String
    let title: String
    let description: String?
    let price: Int
}

struct Desert: Food {
    let image: String
    let title: String
    let description: String?
    let price: Int
}
