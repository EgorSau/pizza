//
//  CategoriesCollectionCell.swift
//  FoodStore
//
//  Created by Egor SAUSHKIN on 14.10.2022.
//

import UIKit

class CategoriesCollectionCell: UICollectionViewCell {

    lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(red: 0.992, green: 0.227, blue: 0.412, alpha: 0.4)
        label.textAlignment = .center
        return label
    }()
    
    private var category: Category?
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.clear()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = 20
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor(red: 0.992, green: 0.227, blue: 0.412, alpha: 0.4).cgColor
        self.backgroundColor = .white
        self.clipsToBounds = true
        self.setupLabel()
    }
    
    func setup(withCategory category: Category) {
        self.contentView.backgroundColor = category.isSelected
        ? UIColor(red: 0.992, green: 0.227, blue: 0.412, alpha: 0.2)
        : .systemBackground
        self.label.textColor = category.isSelected
        ? UIColor(red: 0.992, green: 0.227, blue: 0.412, alpha: 1)
        : UIColor(red: 0.992, green: 0.227, blue: 0.412, alpha: 0.4)
        self.label.text = category.name
    }
    
    private func clear() {
        self.contentView.backgroundColor = .systemBackground
        self.label.textColor = UIColor(red: 0.992, green: 0.227, blue: 0.412, alpha: 0.4)
        self.label.text = ""
    }
    
    private func setupLabel() {
        self.addSubview(label)
        
        let top = label.topAnchor.constraint(equalTo: self.topAnchor)
        let bottom = label.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        let right = label.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        let left = label.leadingAnchor.constraint(equalTo: self.leadingAnchor)
        
        NSLayoutConstraint.activate([top, bottom, right, left])
    }
}
