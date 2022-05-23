//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Вячеслав Мартынов on 15.05.2022.
//

import UIKit

let profileHeaderVC = ProfileHeaderView()

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .lightGray
        viewWillLayoutSubviews()
    }
    
    override func viewWillLayoutSubviews() {
        
        profileHeaderVC.frame = self.view.frame
        view.addSubview(profileHeaderVC)
        self.title = "Profile"
        
        
    }
    
   
        
   

}
