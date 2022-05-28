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
        
        [avatarImageView, fullNameLabel, statusLabel, setStatusButton, statusTextField, avavtarBackView].forEach { addSubview($0) }
        
        setupConstraints()
        setupGestures()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let avavtarBackView: UIView = {
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
    
    private var leadingAvatarImageView = NSLayoutConstraint()
    private var trailingAvatarImageView = NSLayoutConstraint()
    private var heightAvatarImageView = NSLayoutConstraint()
    private var widthAvatarImageView = NSLayoutConstraint()
    private var topAvatarImageView = NSLayoutConstraint()

    
    private let avatarImageView: UIImageView = {
        
        let avatar = UIImageView(image: UIImage(named: "Avatar"))
        avatar.translatesAutoresizingMaskIntoConstraints = false
        
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
        editor.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 15))
        editor.leftViewMode = .always
        editor.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        
        return editor
    }()
    
    @objc private func buttonPressed() {
        if statusTextField.text?.isEmpty == true {
            UITextField.animate(withDuration: 1) {
                self.statusTextField.backgroundColor = .systemRed
            } completion: { _ in
                UITextField.animate(withDuration: 2) {
                    self.statusTextField.backgroundColor = .systemGray6
                }
            }
        } else {
        statusLabel.text = statusText
        print(statusLabel.text ?? "")
        }
    }
    
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
            avavtarBackView.isHidden = false
            self.bringSubviewToFront(avavtarBackView)
            avavtarBackView.backgroundColor = UIColor(white: 0.5, alpha: 0.5)
            
            self.bringSubviewToFront(avatarImageView)
            widthAvatarImageView.constant = UIScreen.main.bounds.width
            heightAvatarImageView.constant = widthAvatarImageView.constant
            leadingAvatarImageView.constant = 0
            topAvatarImageView.constant = UIScreen.main.bounds.height / 2 - heightAvatarImageView.constant / 2
            avatarImageView.layer.cornerRadius = 0
        
            self.layoutIfNeeded()
            
        } completion: { [self]  _ in
            self.addSubview(self.xButton)
            xButton.addTarget(self, action: #selector(reverseAnimation), for: .touchUpInside)

            self.xButton.trailingAnchor.constraint(equalTo: self.avatarImageView.trailingAnchor, constant: -8).isActive = true
            self.xButton.bottomAnchor.constraint(equalTo: self.avatarImageView.topAnchor, constant: -8).isActive = true
            self.xButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
            self.xButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
            self.xButton.alpha = 0

            self.layoutIfNeeded()
            UIButton.animate(withDuration: 0.3) {
                self.xButton.alpha = 1
            }
            
        }
    }
    
    @objc private func reverseAnimation() {
        UIImageView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut) { [self] in
            avavtarBackView.backgroundColor = UIColor(white: 0, alpha: 0)
            xButton.alpha = 0
            widthAvatarImageView.constant = 120
            heightAvatarImageView.constant = widthAvatarImageView.constant
            leadingAvatarImageView.constant = 16
            topAvatarImageView.constant = 16
            avatarImageView.layer.cornerRadius = heightAvatarImageView.constant / 2
            
            self.layoutIfNeeded()

        } completion: {  _ in

        }
        print("tap")
    }
    
    private func setupConstraints() {
        avavtarBackView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
        avavtarBackView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height).isActive = true
        
        leadingAvatarImageView = avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16)
        widthAvatarImageView = avatarImageView.widthAnchor.constraint(equalToConstant: 120)
        heightAvatarImageView = avatarImageView.heightAnchor.constraint(equalToConstant: 120)
        topAvatarImageView = avatarImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16)
        
        
        NSLayoutConstraint.activate([
            leadingAvatarImageView, widthAvatarImageView, heightAvatarImageView, topAvatarImageView
        ])
        
        avatarImageView.layer.cornerRadius = heightAvatarImageView.constant / 2
        
        NSLayoutConstraint.activate([
            fullNameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 27),
            fullNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16 + 120 + 16),
        ])
        
        NSLayoutConstraint.activate([
            statusLabel.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 16),
            statusLabel.leadingAnchor.constraint(equalTo: fullNameLabel.leadingAnchor),
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
            statusTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16 + 120 + 16),
            statusTextField.heightAnchor.constraint(equalToConstant: 40),
            statusTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
    }
    
}
    

    

