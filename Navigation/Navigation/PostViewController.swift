//
//  PostViewController.swift
//  Navigation
//
//  Created by Вячеслав Мартынов on 15.05.2022.
//

import UIKit

struct Post {
    var title: String
}

class PostViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .gray
        self.title = post.title
        
        makeInfoBarItem()
        
        
    }
    
    private func makeInfoBarItem() {
        let infoBarItem = UIBarButtonItem(title: "Info", style: .plain, target: self, action: #selector(infoShow))
        navigationItem.rightBarButtonItem = infoBarItem
    }
    
    @objc private func infoShow() {
        let infoVC = InfoViewController()
        present(infoVC, animated: true)
        
    }
 

}
