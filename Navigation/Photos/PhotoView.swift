//
//  PhotoView.swift
//  Navigation
//
//  Created by Вячеслав Мартынов on 29.05.2022.
//

import UIKit

class PhotoView: UIView {
    
    var photoImageView: UIImageView = {
            let image = UIImageView()
            image.translatesAutoresizingMaskIntoConstraints = false
        
            return image
        }()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        addSubview(photoImageView)
        
        NSLayoutConstraint.activate([
            photoImageView.heightAnchor.constraint(equalTo: self.heightAnchor),
            photoImageView.widthAnchor.constraint(equalTo: self.widthAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

