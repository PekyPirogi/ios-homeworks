//
//  PhotosTableViewCell1.swift
//  Navigation
//
//  Created by Вячеслав Мартынов on 25.05.2022.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {
    
    private var photoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.text = "Photos"
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        
        return label
    }()
    
    private var arrow: UIImageView = {
        let image = UIImageView(image: UIImage(systemName: "arrow.right"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.tintColor = .black
        
        image.contentMode = .scaleAspectFill
        
        return image
    }()
    
    private lazy var photosCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: .infinite, collectionViewLayout: layout)
        
        collection.translatesAutoresizingMaskIntoConstraints = false
        layout.scrollDirection = .horizontal
        collection.dataSource = self
        collection.delegate = self
        collection.register(PhotosProfileCollectionViewCell.self, forCellWithReuseIdentifier: PhotosProfileCollectionViewCell.identifier)
        
        return collection
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout() {
        [photoLabel, arrow, photosCollection].forEach { contentView.addSubview($0) }
        contentView.backgroundColor = .white
        
        NSLayoutConstraint.activate([
            photoLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            photoLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            
        ])
        
        NSLayoutConstraint.activate([
            arrow.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            arrow.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            arrow.heightAnchor.constraint(equalTo: photoLabel.heightAnchor)
            
        ])
        
        NSLayoutConstraint.activate([
            photosCollection.topAnchor.constraint(equalTo:  photoLabel.bottomAnchor),
            photosCollection.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            photosCollection.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            photosCollection.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            photosCollection.heightAnchor.constraint(equalToConstant: 110)
            
            
        ])
    }
    
}

extension PhotosTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photoArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosProfileCollectionViewCell.identifier, for: indexPath) as! PhotosProfileCollectionViewCell
        cell.customizePhotoProfileCell(number: indexPath.row)
        
        return cell
    }
    
    
}

extension PhotosTableViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width - 8 * 3) / 4
        
        return CGSize(width: width, height: width)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        8
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        8
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }
}
