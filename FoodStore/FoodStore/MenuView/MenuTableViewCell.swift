//
//  MenuTableViewCell.swift
//  FoodStore
//
//  Created by Egor SAUSHKIN on 13.10.2022.
//

import UIKit

protocol ViewModelProtocol {}

protocol Setupable {
    func setup(with viewModel: Food)
}

class MenuTableViewCell: UITableViewCell {
    
    struct ViewModel: Food {
        let image: String
        let title: String
        let description: String?
        let price: Int
    }
    
    private lazy var postStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 16
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var pizzaImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var descriptionStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 8
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SFUIDisplay-Semibold", size: 17)
        label.textColor = UIColor(red: 0.133, green: 0.157, blue: 0.192, alpha: 1)
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SFUIDisplay-Regular", size: 13)
        label.textColor = UIColor(red: 0.665, green: 0.668, blue: 0.679, alpha: 1)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SFUIDisplay-Regular", size: 13)
        label.textColor = UIColor(red: 0.992, green: 0.227, blue: 0.412, alpha: 1)
        label.layer.cornerRadius = 6
        label.layer.borderColor = UIColor(red: 0.992, green: 0.227, blue: 0.412, alpha: 1).cgColor
        label.layer.borderWidth = 1
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(){
        
        //MARK: mainStack
        self.contentView.addSubview(postStack)
        self.postStack.addArrangedSubview(pizzaImage)
        self.postStack.addArrangedSubview(descriptionStack)
        let topConstraint = self.postStack.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 16)
        let leadingConstraint = self.postStack.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16)
        let trailingConstraint = self.postStack.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -24)
        let bottomConstraint = self.postStack.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -29)
        
        NSLayoutConstraint.activate([
            topConstraint,
            leadingConstraint,
            trailingConstraint,
            bottomConstraint
        ])

        //MARK: descriptionStack
        self.descriptionStack.addArrangedSubview(titleLabel)
        self.descriptionStack.addArrangedSubview(descriptionLabel)
        let leadingTitleConstraint = self.titleLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 180)

        NSLayoutConstraint.activate([
                                    leadingTitleConstraint
                                    ])

        //MARK: price
        self.descriptionStack.addArrangedSubview(priceLabel)
        let leadingPriceConstraint = self.priceLabel.leadingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -111)
        let heightConstraint = self.priceLabel.heightAnchor.constraint(equalToConstant: 32)
        
        NSLayoutConstraint.activate([
                                    leadingPriceConstraint,
                                    heightConstraint
                                    ])
    }
}

extension MenuTableViewCell: Setupable {
    func setup(with viewModel: Food) {
        self.pizzaImage.image = UIImage(named: viewModel.image)
        self.titleLabel.text = viewModel.title
        self.descriptionLabel.text = viewModel.description
        self.priceLabel.text = "от \(viewModel.price) р"
    }
}
