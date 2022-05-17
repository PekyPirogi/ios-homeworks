//
//  FeedViewController.swift
//  Navigation
//
//  Created by Вячеслав Мартынов on 15.05.2022.
//

import UIKit

let post = Post(title: "Test title")

class FeedViewController: UIViewController {

    override func viewDidLoad() {
        
        super.viewDidLoad()
        postButton()

        // Do any additional setup after loading the view.
    }
    
    private func postButton() {
        let postButton = UIButton(frame: CGRect(x: 200, y: 100, width: 200, height: 50))
        postButton.setTitle("Post", for: .normal)
        postButton.backgroundColor = .gray
        postButton.addTarget(self, action: #selector(postShow), for: .touchUpInside)
        view.addSubview(postButton)
    }
    
    @objc private func postShow() {
        let postVC = PostViewController()
        navigationController?.pushViewController(postVC, animated: true)
    }
                          
                          
}
