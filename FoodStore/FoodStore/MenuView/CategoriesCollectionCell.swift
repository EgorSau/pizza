//
//  CategoriesCollectionCell.swift
//  FoodStore
//
//  Created by Egor SAUSHKIN on 14.10.2022.
//

import UIKit

protocol TableDelegateProtocol {
    func updateTable()
}

class CategoriesCollectionCell: UICollectionViewCell {
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 20
        button.setTitleColor(UIColor(red: 0.992, green: 0.227, blue: 0.412, alpha: 0.4), for: .normal)
        button.layer.borderColor = UIColor(red: 0.992, green: 0.227, blue: 0.412, alpha: 0.4).cgColor
        button.addTarget(.none, action: #selector(buttonPressed), for: .touchUpInside)
        button.clipsToBounds = true
        return button
    }()
    
    var delegate: TableDelegateProtocol?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints(){
        self.contentView.addSubview(self.button)
        let width = self.button.widthAnchor.constraint(equalTo: self.contentView.widthAnchor)
        
        NSLayoutConstraint.activate([
                                    width,
                                    ])
    }

    func uploadButtons(for indexPath: IndexPath){
        let indexValue = Int(indexPath.row)
        let buttonsArray = ["Пицца", "Комбо", "Десерты", "Напитки", "Суши", "Бургеры"]
        self.button.setTitle(buttonsArray[indexValue], for: .normal)
    }
    
    @objc
    func buttonPressed(){
        if button.isSelected == false {
            button.backgroundColor = UIColor(red: 0.992, green: 0.227, blue: 0.412, alpha: 0.2)
            button.setTitleColor(UIColor(red: 0.992, green: 0.227, blue: 0.412, alpha: 1), for: .selected)
            button.isSelected = true
            self.delegate?.updateTable()
        }
        else {
            button.backgroundColor = .white
            button.setTitleColor(UIColor(red: 0.992, green: 0.227, blue: 0.412, alpha: 0.4), for: .selected)
            button.isSelected = false
        }
    }
}

