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
        
        [avatarView, headerView, statusLabel, statusButton, statusEditor] .forEach{addSubview($0)}
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private let avatarView: UIImageView = {
        let avatar = UIImageView(image: UIImage(named: "Avatar"))
        avatar.frame = CGRect(x: 16, y: 92 + 16, width: 100, height: 100)
        avatar.layer.cornerRadius = 40
        avatar.layer.borderWidth = 3
        avatar.layer.borderColor = UIColor.white.cgColor
        avatar.layer.masksToBounds = true
        
        return avatar
    }()
    
   private let headerView: UILabel = {
       let header = UILabel(frame: CGRect(x: 150, y: 92 + 27, width: 200, height: 18))
       header.backgroundColor = .lightGray
       header.font = UIFont.systemFont(ofSize: 18, weight: .bold)
       header.text = "Super Dog"
        
        return header
    }()
    
    private let statusLabel: UILabel = {
        let status = UILabel(frame: CGRect(x: 150, y: 92 + 54, width: 200, height: 18))
        status.backgroundColor = .lightGray
        status.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        status.textColor = .gray
        status.text = "Waiting for something..."
         
        return status
     }()
    
    private lazy var statusButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 16, y: 92 + 16 + 100 + 16, width: 358, height: 50))
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Get status", for: .normal)
        button.layer.cornerRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowRadius = 4
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowOpacity = 0.7
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
         
        return button
     }()
    
    @objc private func buttonPressed() {
        statusLabel.text = statusText
        print(statusLabel.text ?? "")
    }
    
    
    private var statusEditor: UITextField = {
        let editor = UITextField(frame: CGRect(x: 150, y: 92 + 54 + 18 + 5, width: 200, height: 40))
        editor.backgroundColor = .white
        editor.textColor = .black
        editor.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        editor.layer.cornerRadius = 12
        editor.layer.borderWidth = 1
        editor.layer.borderColor = UIColor.black.cgColor
        editor.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: editor.frame.height))
        editor.leftViewMode = .always
        editor.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        
        return editor
    }()
    
    @objc private func statusTextChanged(_ textField: UITextField) {
        statusText.removeAll()
        statusText.append(textField.text ?? "")
    }

}
    

    

