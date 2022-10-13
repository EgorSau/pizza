//
//  CategoriesCollectionCell.swift
//  FoodStore
//
//  Created by Egor SAUSHKIN on 14.10.2022.
//

import UIKit

class CategoriesCollectionCell: UICollectionViewCell {
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 20
        button.setTitleColor(UIColor(red: 0.992, green: 0.227, blue: 0.412, alpha: 0.4), for: .normal)
        button.setTitleColor(UIColor(red: 0.992, green: 0.227, blue: 0.412, alpha: 1), for: .selected)
        button.layer.borderColor = UIColor(red: 0.992, green: 0.227, blue: 0.412, alpha: 0.4).cgColor
        button.addTarget(.none, action: #selector(buttonPressed), for: .touchUpInside)
        button.clipsToBounds = true
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.addSubview(self.button)
        
//        let topConstraint = self.button.topAnchor.constraint(equalTo: self.contentView.topAnchor)
//        let centerX = self.button.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor)
//        let centerY = self.button.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor)
        let height = self.button.heightAnchor.constraint(equalTo: self.contentView.heightAnchor)
        let width = self.button.widthAnchor.constraint(equalTo: self.contentView.widthAnchor)
//        let photoAspectRatio = self.button.heightAnchor.constraint(equalTo: self.button.widthAnchor, multiplier: 1.0)
        
        NSLayoutConstraint.activate([
//                                    topConstraint,
//                                    centerX,
//                                    centerY,
                                    width,
                                    height,
//                                    photoAspectRatio
                                    ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func uploadButtons(for indexPath: IndexPath){
        let indexValue = Int(indexPath.row)
        let buttonsArray = ["Пицца", "Комбо", "Десерты", "Напитки"]
        self.button.setTitle(buttonsArray[indexValue], for: .normal)
        //понадобится для АПИ
//        let photoName = model.imgArray[indexValue]
//        self.photoImage.image = UIImage(named: photoName)
    }
    
    func itemSize(for width: CGFloat, with spacing: CGFloat) -> CGSize {
        // 3 элемента в ряду
        let neededWidth = width - 4 * spacing
        let itemWidth = floor(neededWidth / 3)
//        return CGSize(width: itemWidth, height: itemWidth)
        return CGSize(width: 88, height: 32)
    }
    
    @objc
    func buttonPressed(){
        button.backgroundColor = UIColor(red: 0.992, green: 0.227, blue: 0.412, alpha: 0.2)
    }
}

