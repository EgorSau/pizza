//
//  CategoriesCollectionCell.swift
//  FoodStore
//
//  Created by Egor SAUSHKIN on 14.10.2022.
//

import UIKit

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
    
    var isFlagged = false
    var previousIndex = ""
    
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

    func uploadButtons(for indexPath: IndexPath) {
        let indexValue = Int(indexPath.row)
        let selectedButton = ButtonsModel.buttonsArray[indexValue]
        self.button.setTitle(selectedButton, for: .normal)
        print("1")
        print(ButtonsModel.flagsArray)
        if indexValue == 0 {
            button.backgroundColor = ButtonsModel.ButtonColors.backgroundPink
            button.setTitleColor(ButtonsModel.ButtonColors.titleBrightPink, for: .selected)
            ButtonsModel.flagsArray[indexValue] = true
        }
    }
    
    @objc
    func buttonPressed(){
        print("2")
        print(previousIndex)
        print(ButtonsModel.flagsArray)
        button.backgroundColor = ButtonsModel.ButtonColors.backgroundPink
        button.setTitleColor(ButtonsModel.ButtonColors.titleBrightPink, for: .selected)
        guard let selectedButton = button.titleLabel?.text else { return }
        guard let buttonIndexString = ButtonsModel.buttonsArray.firstIndex(of: selectedButton)?.description else { return }
        guard let index = Int(buttonIndexString) else { return }
        ButtonsModel.flagsArray[index] = true
        print("3")
        print(previousIndex)
        print(ButtonsModel.flagsArray)
        clearFlag(indexSelected: 0)
        previousIndex = selectedButton
    }
    
    func clearFlag(indexSelected: Int){
        print("4")
        print(previousIndex)
        print(ButtonsModel.flagsArray)
//        button.backgroundColor = ButtonsModel.ButtonColors.backgroundWhite
//        button.setTitleColor(ButtonsModel.ButtonColors.titleLightPink, for: .selected)
        ButtonsModel.flagsArray[indexSelected] = false
        print("5")
        print(previousIndex)
        print(ButtonsModel.flagsArray)
//        uploadButtons(for: IndexPath(row: indexSelected, section: 0))
//        }
    }
}
