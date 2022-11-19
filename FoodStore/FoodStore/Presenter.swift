//
//  Presenter.swift
//  FoodStore
//
//  Created by Egor SAUSHKIN on 13.10.2022.
//

import UIKit

class Presenter {
    
    var postArray = [PostModel]()
    
    func addPizzaPostsIntoArray(){
        let post1 = PostModel(image: PizzaImagesModel.name.pizza1,
                              title: PizzaTitleModel.name.title1,
                              description: PizzaDescriptionModel.name.description1,
                              price: PizzaPriceModel.name.price)

        let post2 = PostModel(image: PizzaImagesModel.name.pizza2,
                              title: PizzaTitleModel.name.title2,
                              description: PizzaDescriptionModel.name.description2,
                              price: PizzaPriceModel.name.price)

        let post3 = PostModel(image: PizzaImagesModel.name.pizza3,
                              title: PizzaTitleModel.name.title3,
                              description: PizzaDescriptionModel.name.description3,
                              price: PizzaPriceModel.name.price)

        let post4 = PostModel(image: PizzaImagesModel.name.pizza4,
                              title: PizzaTitleModel.name.title4,
                              description: PizzaDescriptionModel.name.description4,
                              price: PizzaPriceModel.name.price)

        self.postArray.append(contentsOf: [post1, post2, post3, post4])
    }
    
    func addComboPostsIntoArray(){
        let post1 = PostModel(image: ComboImagesModel.name.combo1,
                              title: ComboTitleModel.name.title1,
                              description: ComboDescriptionModel.name.description1,
                              price: ComboPriceModel.name.price)

        let post2 = PostModel(image: ComboImagesModel.name.combo2,
                              title: ComboTitleModel.name.title2,
                              description: ComboDescriptionModel.name.description2,
                              price: ComboPriceModel.name.price)

        let post3 = PostModel(image: ComboImagesModel.name.combo3,
                              title: ComboTitleModel.name.title3,
                              description: ComboDescriptionModel.name.description3,
                              price: ComboPriceModel.name.price)

        let post4 = PostModel(image: ComboImagesModel.name.combo4,
                              title: ComboTitleModel.name.title4,
                              description: ComboDescriptionModel.name.description4,
                              price: ComboPriceModel.name.price)

        self.postArray.append(contentsOf: [post1, post2, post3, post4])
    }
}

