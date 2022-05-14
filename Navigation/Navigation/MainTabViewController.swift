//
//  MainTabViewController.swift
//  Navigation
//
//  Created by Вячеслав Мартынов on 14.05.2022.
//

import UIKit

class MainTabViewController: UITabBarController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupControllers()
        
    }
    
    private func setupControllers() {
        let profileVC = ProfileViewController()
        let feedVC = FeedViewController()
        let profileNavController = UINavigationController(rootViewController: profileVC )
        let feedNavController = UINavigationController(rootViewController: feedVC)
        
        profileVC.tabBarItem.title = "Profile"
        profileVC.tabBarItem.image = UIImage(systemName: "person.circle")
        feedVC.tabBarItem.title = "Feed"
        feedVC.tabBarItem.image = UIImage(systemName: "play")
        
        viewControllers = [profileVC, feedVC]
    }
    
}
