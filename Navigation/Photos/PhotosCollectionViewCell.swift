//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by Вячеслав Мартынов on 24.05.2022.
//

import UIKit

protocol PhotosCVCellDelegate: AnyObject {
    func showPhoto(photo: UIImage)
}

class PhotosCollectionViewCell: UICollectionViewCell {
    weak var photosCVCellDelegate: PhotosCVCellDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(photoCellImageView)
        setupGestures()
        
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
    
    private func setupGestures() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapAction))
        photoCellImageView.isUserInteractionEnabled = true
        photoCellImageView.addGestureRecognizer(tapGesture)
    }
    
    @objc private func tapAction() {
        let defaultImage = UIImage()
        photosCVCellDelegate?.showPhoto(photo: (photoCellImageView.image ?? defaultImage))
    }
    
     func customizePhotoCell(number: Int) {
        photoCellImageView.image = photoArray[number]
    }
    
}
