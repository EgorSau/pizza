//
//  Presenter.swift
//  FoodStore
//
//  Created by Egor SAUSHKIN on 13.10.2022.
//

import UIKit

class Presenter {
    
    var postArray = [PostModel]()
    
    func addPostsIntoArray(){
        let post1 = PostModel(image: ImagesModel.name.pizza1,
                              title: TitleModel.name.title1,
                              description: DescriptionModel.name.description1,
                              price: PriceModel.name.price)

        let post2 = PostModel(image: ImagesModel.name.pizza2,
                              title: TitleModel.name.title2,
                              description: DescriptionModel.name.description2,
                              price: PriceModel.name.price)

        let post3 = PostModel(image: ImagesModel.name.pizza3,
                              title: TitleModel.name.title3,
                              description: DescriptionModel.name.description3,
                              price: PriceModel.name.price)

        let post4 = PostModel(image: ImagesModel.name.pizza4,
                              title: TitleModel.name.title4,
                              description: DescriptionModel.name.description4,
                              price: PriceModel.name.price)

        self.postArray.append(contentsOf: [post1, post2, post3, post4])
    }
}

