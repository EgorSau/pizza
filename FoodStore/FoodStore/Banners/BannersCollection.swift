//
//  BannersCollection.swift
//  FoodStore
//
//  Created by Egor SAUSHKIN on 14.10.2022.
//

import UIKit

class BannersCollection: UIView {
    
    private lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 8
        layout.minimumLineSpacing = 8
        layout.sectionInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        return layout
    }()
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(BannersCollectionCell.self, forCellWithReuseIdentifier: "BannerCell")
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "DefaultCell")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(){
        self.addSubview(self.collectionView)
        
        let topConstraint = self.collectionView.topAnchor.constraint(equalTo: self.topAnchor)
        let leftConstraint = self.collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor)
        let rightConstraint = self.collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        let height = self.collectionView.heightAnchor.constraint(equalToConstant: 112)
        
        NSLayoutConstraint.activate([
                                    topConstraint,
                                    leftConstraint,
                                    rightConstraint,
                                    height
                                    ])
    }
}

extension BannersCollection: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BannerCell", for: indexPath) as? BannersCollectionCell else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DefaultCell", for: indexPath)
            return cell
        }
        
        NetworkService().request(for: stringUrl) { result in
            guard let data = try? result.get() else { return }
            Mapper().parse(Cat.self, from: data) { image in
                guard let imageName = try? image.get().file else { return }
                guard let url = URL(string: imageName) else { return }
                guard let data = try? Data(contentsOf: url, options: []) else { return }
                guard let image = UIImage(data: data) else { return }
                DispatchQueue.main.async {
                    cell.photoImage.image = image
                }
            }
        }

        cell.backgroundColor = .systemPink
        cell.clipsToBounds = true
        cell.layer.cornerRadius = 10
        cell.contentMode = .scaleAspectFit
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 300, height: 112)
    }
}
