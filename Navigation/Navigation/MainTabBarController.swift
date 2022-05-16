//
//  MainTabBarController.swift
//  Navigation
//
//  Created by Вячеслав Мартынов on 15.05.2022.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupControllers()

    }
    
    private func setupControllers() {
        let feedVC = UINavigationController(rootViewController: FeedViewController())
        let profileVC = UINavigationController(rootViewController: ProfileViewController())
        
        feedVC.tabBarItem.title = "Feed"
        feedVC.tabBarItem.image = UIImage(systemName: "person.3.sequence.fill")
        profileVC.tabBarItem.title = "Profile"
        profileVC.tabBarItem.image = UIImage(systemName: "person.crop.circle")
        
        viewControllers = [profileVC,feedVC]
    }

}
