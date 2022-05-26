//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Вячеслав Мартынов on 16.05.2022.
//

import Foundation
import UIKit

class ProfileHeaderView: UIView {
    
    private var statusText: String
    
    
    override init(frame: CGRect){
        statusText = ""
        super .init(frame: frame)
        setupGestures()
        
        [avatarImageView, fullNameLabel, statusLabel, setStatusButton, statusTextField].forEach { addSubview($0) }
        
        leadingAvatarImageView = avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16)
        widthAvatarImageView = avatarImageView.widthAnchor.constraint(equalToConstant: 100)
        heightAvatarImageView = avatarImageView.heightAnchor.constraint(equalToConstant: 100)
        topAvatarImageView = avatarImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16)
        
        
        NSLayoutConstraint.activate([
            leadingAvatarImageView, widthAvatarImageView, heightAvatarImageView, topAvatarImageView
        ])
        
        NSLayoutConstraint.activate([
            fullNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 27),
            fullNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),
        ])
        
        NSLayoutConstraint.activate([
            statusLabel.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 16),
            statusLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),
        ])
        
        NSLayoutConstraint.activate([
            setStatusButton.topAnchor.constraint(equalTo: statusTextField.bottomAnchor, constant: 16),
            setStatusButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            setStatusButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            setStatusButton.heightAnchor.constraint(equalToConstant: 50),
            setStatusButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            statusTextField.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 16),
            statusTextField.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),
            statusTextField.heightAnchor.constraint(equalToConstant: 40),
            statusTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let avavtarBackView: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(white: 1, alpha: 1)
        
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
        button.addTarget(self, action: #selector(reverseAnimation), for: .touchUpInside)
        
        return button
    }()
    
    private var leadingAvatarImageView = NSLayoutConstraint()
    private var trailingAvatarImageView = NSLayoutConstraint()
    private var heightAvatarImageView = NSLayoutConstraint()
    private var widthAvatarImageView = NSLayoutConstraint()
    private var topAvatarImageView = NSLayoutConstraint()

    
    private let avatarImageView: UIImageView = {
        
        let avatar = UIImageView(image: UIImage(named: "Avatar"))
        avatar.translatesAutoresizingMaskIntoConstraints = false
        avatar.layer.cornerRadius = 40
        avatar.layer.borderWidth = 3
        avatar.layer.borderColor = UIColor.white.cgColor
        avatar.layer.masksToBounds = true
        
        return avatar
    }()
    
   private let fullNameLabel: UILabel = {
       let header = UILabel()
       header.translatesAutoresizingMaskIntoConstraints = false
       header.font = UIFont.systemFont(ofSize: 18, weight: .bold)
       header.text = "Super Dog"
        
        return header
    }()
    
    private let statusLabel: UILabel = {
        let status = UILabel()
        status.translatesAutoresizingMaskIntoConstraints = false
        status.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        status.textColor = .black
        status.text = "Waiting for something..."
         
        return status
     }()
    
    private lazy var setStatusButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Get status", for: .normal)
        button.layer.cornerRadius = 4
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
         
        return button
     }()
    
    @objc private func buttonPressed() {
        statusLabel.text = statusText
        print(statusLabel.text ?? "")
    }
    
    private var statusTextField: UITextField = {
        let editor = UITextField()
        editor.translatesAutoresizingMaskIntoConstraints = false
        editor.backgroundColor = .white
        editor.textColor = .black
        editor.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        editor.layer.cornerRadius = 12
        editor.layer.borderWidth = 1
        editor.layer.borderColor = UIColor.black.cgColor
        editor.placeholder = "Whats up?"
        editor.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        
        return editor
    }()
    
    @objc private func statusTextChanged(_ textField: UITextField) {
        statusText.removeAll()
        statusText.append(textField.text ?? "")
    }
    
    private func setupGestures() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapAction))
        avatarImageView.isUserInteractionEnabled = true
        avatarImageView.addGestureRecognizer(tapGesture)
    }
    
    @objc private func tapAction() {
        UIImageView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut) { [self] in
            window?.addSubview(avavtarBackView)
            window?.bringSubviewToFront(avavtarBackView)
            
            avavtarBackView.backgroundColor = UIColor(white: 0.5, alpha: 0.5)
            avavtarBackView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
            avavtarBackView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height).isActive = true
            avavtarBackView.layoutIfNeeded()
            avavtarBackView.addSubview(avatarImageView)
            
            
            
            avatarImageView.centerXAnchor.constraint(equalTo: avavtarBackView.centerXAnchor).isActive = true
            avatarImageView.centerYAnchor.constraint(equalTo: avavtarBackView.centerYAnchor).isActive = true
            widthAvatarImageView.constant = UIScreen.main.bounds.width
            heightAvatarImageView.constant = widthAvatarImageView.constant
            
            avatarImageView.layoutIfNeeded()
            
        } completion: {  _ in
            
            self.avavtarBackView.addSubview(self.xButton)
            
            self.xButton.trailingAnchor.constraint(equalTo: self.avavtarBackView.trailingAnchor, constant: -8).isActive = true
            self.xButton.bottomAnchor.constraint(equalTo: self.avatarImageView.topAnchor, constant: -8).isActive = true
            self.xButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
            self.xButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        }
    }
    
    @objc private func reverseAnimation() {
        
    }
    
}
    

    

