//
//  NetworkError.swift
//  FoodStore
//
//  Created by Саидов Тимур on 25.11.2022.
//

import Foundation

enum NetworkError: Error {
    case custom(description: String)
    case parse(reason: String)
    case lostInternet
    case unknown
}
