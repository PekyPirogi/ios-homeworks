//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by Вячеслав Мартынов on 24.05.2022.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(photoCellImageView)
        
        NSLayoutConstraint.activate([
            photoCellImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            photoCellImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            photoCellImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            photoCellImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            photoCellImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            photoCellImageView.heightAnchor.constraint(equalTo: contentView.heightAnchor)
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private var photoCellImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        
        
        return image
    }()
    
     func customizePhotoCell(number: Int) {
        photoCellImageView.image = photoArray[number]
    }
    
}

class PhotosCollectionProfileViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(photoCellImageView)
        
        NSLayoutConstraint.activate([
            photoCellImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            photoCellImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            photoCellImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            photoCellImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            photoCellImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            photoCellImageView.heightAnchor.constraint(equalTo: contentView.heightAnchor)
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private var photoCellImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        
        
        return image
    }()
    
     func customizePhotoCell(number: Int) {
         photoCellImageView.image = photoArray[number]
         photoCellImageView.layer.cornerRadius = 6
    }
    
}
