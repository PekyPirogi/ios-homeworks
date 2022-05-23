//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Вячеслав Мартынов on 15.05.2022.
//

import UIKit



class ProfileViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let profileHeaderVC = ProfileHeaderView()
        profileHeaderVC.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(profileHeaderVC)
        self.title = "Profile"
        
        
        
        NSLayoutConstraint.activate([
            profileHeaderVC.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profileHeaderVC.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            profileHeaderVC.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            profileHeaderVC.heightAnchor.constraint(equalToConstant: 220)
        ])
        
        

        view.backgroundColor = .lightGray
    }
    
}
