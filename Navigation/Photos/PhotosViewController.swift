//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Вячеслав Мартынов on 24.05.2022.
//

import UIKit

var photoArray: [UIImage] = {
    var array = [UIImage]()
    var name = 0
    for photo in 0...19 {
        name += 1
        array.append(UIImage(named: String(name))!)
    }
    
    return array
}()

class PhotosViewController: UIViewController {

    private lazy var photoView = PhotoView()
    
    private lazy var photoCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.dataSource = self
        collection.delegate = self
        collection.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: PhotosCollectionViewCell.identifier)
        
        return collection
    }()

    private let photoBackView: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(white: 0, alpha: 0)
        view.isHidden = true

        return view
    }()
    
    private var xButton: UIButton = {
        let button = UIButton()
        let buttonImage = UIImage(systemName: "multiply.circle")
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(buttonImage, for: .normal)
        button.tintColor = .black
        button.clipsToBounds = true
        button.contentMode = .scaleAspectFill

        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Photo Gallery"
        layout()
        navigationController?.navigationBar.isHidden = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    private func layout() {
        view.addSubview(photoCollectionView)
        view.addSubview(photoBackView)
        
        NSLayoutConstraint.activate([
            photoCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            photoCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            photoCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            photoCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            photoBackView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            photoBackView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height)
        ])
    }
}

// MARK: - UICollectionViewDataSource

extension PhotosViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photoArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosCollectionViewCell.identifier, for: indexPath) as! PhotosCollectionViewCell
        cell.customizePhotoCell(number: indexPath.row)
        cell.photosCVCellDelegate = self
        
        return cell
    }
    
    
}

// MARK: - UICollectionViewDelegateFlowLayout

extension PhotosViewController: UICollectionViewDelegateFlowLayout {
    private var universalInset: CGFloat { return 8 }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - universalInset * 4) / 3
        
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        universalInset
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        universalInset
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: universalInset, left: universalInset, bottom: universalInset, right: universalInset)
    }
}

extension PhotosViewController: PhotosCVCellDelegate {
    func showPhoto(photo: UIImage) {
        photoView.translatesAutoresizingMaskIntoConstraints = false
        photoView.photoImageView.image = photo
        UIImageView.animate(withDuration: 2, delay: 0, options: .curveEaseInOut) { [self] in
            photoBackView.isHidden = false
            photoBackView.backgroundColor = UIColor(white: 0.5, alpha: 0.5)
            
            view.addSubview(photoView)
            NSLayoutConstraint.activate([
                photoView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
                photoView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
                photoView.heightAnchor.constraint(equalTo: photoView.widthAnchor),
                photoView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor)
            ])

            photoView.layoutIfNeeded()

        } completion: { [self] _ in
            view.addSubview(xButton)
            xButton.addTarget(self, action: #selector(reverseAnimation), for: .touchUpInside)

            self.xButton.trailingAnchor.constraint(equalTo: photoView.trailingAnchor, constant: -8).isActive = true
            self.xButton.bottomAnchor.constraint(equalTo: photoView.topAnchor, constant: -8).isActive = true
            self.xButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
            self.xButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
            self.xButton.alpha = 0

            xButton.layoutIfNeeded()
            UIButton.animate(withDuration: 0.3) {
                self.xButton.alpha = 1
            }
        }
    }

    @objc private func reverseAnimation() {
        UIImageView.animate(withDuration: 2, delay: 0, options: .curveEaseInOut) { [self] in
            photoBackView.backgroundColor = UIColor(white: 0, alpha: 0)
            photoBackView.isHidden = true
            xButton.alpha = 0
            photoBackView.layoutIfNeeded()
            xButton.layoutIfNeeded()
            photoView.removeFromSuperview() // тут плохо работает, не понял пока, как сделать красиво.
            photoView.layoutIfNeeded()
            }
        }
    }

