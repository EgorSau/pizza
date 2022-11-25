//
//  ButtonsModel.swift
//  FoodStore
//
//  Created by Egor SAUSHKIN on 24.11.2022.
//

import UIKit

class ButtonsModel {
    static let buttonsArray = ["Пицца", "Комбо", "Десерты", "Напитки", "Суши", "Бургеры"]
    static var flagsArray = [false, false, false, false, false, false]
    
    struct ButtonColors {
        static let backgroundPink = UIColor(red: 0.992, green: 0.227, blue: 0.412, alpha: 0.2)
        static let backgroundWhite = UIColor.white
        static let titleBrightPink = UIColor(red: 0.992, green: 0.227, blue: 0.412, alpha: 1)
        static let titleLightPink = UIColor(red: 0.992, green: 0.227, blue: 0.412, alpha: 0.4)
    }
    
    func returnButtonName(for indexPath: IndexPath) -> String {
        return ButtonsModel.buttonsArray[indexPath.row]
    }
}
