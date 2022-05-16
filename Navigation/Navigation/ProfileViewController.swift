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

        view.backgroundColor = .lightGray
        
        viewWillLayoutSubviews()
    }
    
    override func viewWillLayoutSubviews() {
        let profileHeaderVC = ProfileHeaderView()
        profileHeaderVC.frame = view.safeAreaLayoutGuide.layoutFrame
        view.addSubview(profileHeaderVC)
        
    }
    
   
        
   

}
