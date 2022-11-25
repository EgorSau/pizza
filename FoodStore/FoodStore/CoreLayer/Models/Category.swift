//
//  Category.swift
//  FoodStore
//
//  Created by Саидов Тимур on 25.11.2022.
//

import Foundation

final class Category: Hashable {
    let name: String
    let priority: Int
    var isSelected: Bool
    
    private let id: String
    
    init(name: String, priority: Int, isSelected: Bool) {
        self.name = name
        self.priority = priority
        self.isSelected = isSelected
        self.id = UUID().uuidString
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
    }
    
    static func == (lhs: Category, rhs: Category) -> Bool {
        lhs.id == rhs.id
    }
}
