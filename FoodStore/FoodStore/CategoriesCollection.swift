//
//  CategoriesCollection.swift
//  FoodStore
//
//  Created by Egor SAUSHKIN on 14.10.2022.
//

import UIKit

protocol CategoryHeaderViewDelegate: AnyObject {
    func didSelectNewCategory(_ newSelectedCategory: String)
}

class CategoriesCollection: UIView {
    
    private var categories: [Category] = []
    weak var delegate: CategoryHeaderViewDelegate?
    
    private lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 8
        layout.minimumLineSpacing = 8
        layout.sectionInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        return layout
    }()
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CategoriesCollectionCell.self, forCellWithReuseIdentifier: "CategoryCell")
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "DefaultCell")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.collectionView.reloadData()
        self.setupView()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(withCategories categories: [Category]) {
        self.categories = categories
        self.collectionView.reloadData()
    }
    
    private func setupView(){
        self.addSubview(self.collectionView)
        
        let top = self.collectionView.topAnchor.constraint(equalTo: self.topAnchor)
        let left = self.collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor)
        let right = self.collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        let height = self.collectionView.heightAnchor.constraint(equalToConstant: 50)

        NSLayoutConstraint.activate([
                                    top,
                                    left,
                                    right,
                                    height
                                    ])
    }
}

extension CategoriesCollection: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let categoriesSorted = categories.sorted(by: {$0.priority<$1.priority})
        if categoriesSorted[indexPath.row].isSelected == false {
            categoriesSorted[indexPath.row].isSelected.toggle()
        }
        self.delegate?.didSelectNewCategory(categoriesSorted[indexPath.row].name)
        collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as? CategoriesCollectionCell else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DefaultCell", for: indexPath)
            return cell
        }
        let categoriesSorted = categories.sorted(by: {$0.priority<$1.priority})
        cell.setup(withCategory: categoriesSorted[indexPath.row])
        if categoriesSorted[indexPath.row].isSelected {
            categoriesSorted[indexPath.row].isSelected.toggle()
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 88, height: 32)
    }
}
