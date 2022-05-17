//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Вячеслав Мартынов on 16.05.2022.
//

import Foundation
import UIKit

class ProfileHeaderView: UIView {
    override init(frame: CGRect){
        super .init(frame: frame)
        
        [avatarView, headerView, statusText, statusButton, headerBack] .forEach{addSubview($0)}
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private let avatarView: UIImageView = {
        let avatar = UIImageView(image: UIImage(named: "Avatar"))
        avatar.frame = CGRect(x: 16, y: 92 + 16, width: 80, height: 80)
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
    
    private let statusText: UILabel = {
        let status = UILabel(frame: CGRect(x: 150, y: 92 + 78, width: 200, height: 18))
        status.backgroundColor = .lightGray
        status.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        status.textColor = .gray
        status.text = "Waiting for something..."
         
        return status
     }()
    
    private lazy var statusButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 16, y: 92 + 112, width: 358, height: 50))
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Show status", for: .normal)
        button.layer.cornerRadius = 4
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
         
        return button
     }()
    
    @objc private func buttonPressed() {
        print(statusText.text ?? "")
    }
    
    private var headerBack: UIView = {
        let background = UIView(frame: CGRect(x: 0, y: 0, width: 400, height: 92))
        background.backgroundColor = .white
        
        return background
    }()


}
    

    

