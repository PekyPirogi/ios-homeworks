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
        let profileVC = UINavigationController(rootViewController: LoginViewController())
        
        feedVC.tabBarItem.title = "Feed"
        feedVC.tabBarItem.image = UIImage(systemName: "person.3.sequence.fill")
        profileVC.tabBarItem.title = "Profile"
        profileVC.tabBarItem.image = UIImage(systemName: "person.crop.circle")
        
        
        
        tabBar.backgroundColor = .white
        
        
        if #available(iOS 13.0, *) {
            let navBarAppearance = UINavigationBarAppearance()
            navBarAppearance.configureWithOpaqueBackground()
            navBarAppearance.backgroundColor = .white
            UINavigationBar.appearance().standardAppearance = navBarAppearance
            UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
        }
        
        
        viewControllers = [feedVC, profileVC]
    }

}
