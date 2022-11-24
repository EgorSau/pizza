//
//  BannersCollectionCell.swift
//  FoodStore
//
//  Created by Egor SAUSHKIN on 14.10.2022.
//

import UIKit

class BannersCollectionCell: UICollectionViewCell {
    
    lazy var photoImage: UIImageView = {
        let photoImage = UIImageView()
        photoImage.translatesAutoresizingMaskIntoConstraints = false
        return photoImage
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints(){
        self.contentView.addSubview(self.photoImage)
        
        let topConstraint = self.photoImage.topAnchor.constraint(equalTo: self.contentView.topAnchor)
        let centerY = self.photoImage.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor)
        let left = self.photoImage.leftAnchor.constraint(equalTo: self.contentView.leftAnchor)
        let right = self.photoImage.rightAnchor.constraint(equalTo: self.contentView.rightAnchor)
        
        NSLayoutConstraint.activate([
                                    topConstraint,
                                    centerY,
                                    left,
                                    right
                                    ])
    }
    
    //MARK: function for assets
    func uploadPhotos(for indexPath: IndexPath){
        let indexValue = Int(indexPath.row)
        self.photoImage.image = UIImage(named: String(indexValue+1))
    }
    
    //MARK: function for API
    func uploadPhotos(for image: UIImage) {
        DispatchQueue.main.async { [weak self] in
            self?.photoImage.image = image
        }
    }
}
