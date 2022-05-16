//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Вячеслав Мартынов on 16.05.2022.
//

import Foundation
import UIKit

class ProfileHeaderView: UIView {
    
    
    let avatarView: UIView = {
        let avatar = UIImageView(image: UIImage(named: "Avatar"))
        avatar.frame = CGRect(x: 16, y: 16, width: 80, height: 80)
        avatar.layer.cornerRadius = 40
        avatar.layer.borderWidth = 3
        avatar.layer.borderColor = CGColor(red: 255, green: 255, blue: 255, alpha: 1)
        avatar.layer.masksToBounds = true
        
        return avatar
    }()
    
   /* let headerView: UIView = {
        let header = UITextView(frame: CGRect(x: 0, y: 27, width: 200, height: 18))
        header.center = profileHeaderVC.center
        header.backgroundColor = .gray
        header.font = UIFont.boldSystemFont(ofSize: 18)
        header.text = "Super Dog"
        
        return header
    }()
    */
    
    func addElements() {
        self.addSubview(avatarView)
       // self.addSubview(headerView)
    }
    

}
    

    

