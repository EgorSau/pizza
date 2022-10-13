//
//  MenuTableViewCell.swift
//  FoodStore
//
//  Created by Egor SAUSHKIN on 13.10.2022.
//

import UIKit

protocol ViewModelProtocol {}

protocol Setupable {
    func setup(with viewModel: ViewModelProtocol)
}

class MenuTableViewCell: UITableViewCell {
    
    struct ViewModel: ViewModelProtocol {
        var image: String
        var title: String
        var description: String
        var price: String
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
//        image.backgroundColor = .black
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var descriptionStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 8 // надо проверить
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

        let topConstraint = self.postStack.topAnchor.constraint(equalTo: self.contentView.topAnchor)
        let leadingConstraint = self.postStack.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor)
        let trailingConstraint = self.postStack.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor)
        let bottomConstraint = self.postStack.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor)
    
        NSLayoutConstraint.activate([
                                    topConstraint,
                                    leadingConstraint,
                                    trailingConstraint,
                                    bottomConstraint
                                    ])
        //MARK: image
        self.postStack.addArrangedSubview(pizzaImage)
        
        let topImageConstraint = self.pizzaImage.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 16)
        let leadingImageConstraint = self.pizzaImage.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16)
        let bottomImageConstraint = self.pizzaImage.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -29)
    
        NSLayoutConstraint.activate([
                                    topImageConstraint,
                                    leadingImageConstraint,
                                    bottomImageConstraint
                                    ])
        
        //MARK: title & description
        self.postStack.addArrangedSubview(descriptionStack)
        
        let trailingStackConstraint = self.descriptionStack.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -24)
        
        NSLayoutConstraint.activate([
                                    trailingStackConstraint
                                    ])
        
        self.descriptionStack.addArrangedSubview(titleLabel)
        self.descriptionStack.addArrangedSubview(descriptionLabel)
        
        let leadingTitleConstraint = self.titleLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 180)
        let leadingDescriptionConstraint = self.descriptionLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 180)
        
        NSLayoutConstraint.activate([
                                    leadingTitleConstraint,
                                    leadingDescriptionConstraint
                                    ])

        //MARK: price
        self.descriptionStack.addArrangedSubview(priceLabel)
        
        let topPriceConstraint = self.priceLabel.topAnchor.constraint(equalTo: self.descriptionLabel.bottomAnchor, constant: 15)
        let leadingPriceConstraint = self.priceLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 264)
        let heightConstraint = self.priceLabel.heightAnchor.constraint(equalToConstant: 32)
        let widthConstraint = self.priceLabel.widthAnchor.constraint(equalToConstant: 87)
        
        NSLayoutConstraint.activate([
                                    topPriceConstraint,
                                    leadingPriceConstraint,
                                    heightConstraint,
                                    widthConstraint
                                    ])
    }
}

extension MenuTableViewCell: Setupable {
    
    func setup(with viewModel: ViewModelProtocol) {
        guard let viewModel = viewModel as? ViewModel else { return }
        
        self.pizzaImage.image = UIImage(named: viewModel.image)
        self.titleLabel.text = viewModel.title
        self.descriptionLabel.text = viewModel.description
        self.priceLabel.text = viewModel.price
    }
}
