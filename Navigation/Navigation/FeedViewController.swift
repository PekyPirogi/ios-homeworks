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
        addPostStackView()

        // Do any additional setup after loading the view.
    }

    private let postStackView: UIStackView = {
       let postSV = UIStackView()
        postSV.translatesAutoresizingMaskIntoConstraints = false
        postSV.axis = .vertical
        postSV.distribution = .fillEqually
        postSV.spacing = 10
        
        return postSV
    }()
    
    private func addPostStackView() {
        view.addSubview(postStackView)
        
        [postButton, postButton1].forEach { postStackView.addArrangedSubview($0) }
        
        NSLayoutConstraint.activate([
            postStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            postStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            postStackView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
    }
    
    private let postButton: UIButton = {
        let postButton = UIButton()
        postButton.setTitle("Post", for: .normal)
        postButton.backgroundColor = .gray
        postButton.addTarget(self, action: #selector(postShow), for: .touchUpInside)
        
        return postButton
    }()
    
    private let postButton1: UIButton = {
        let postButton = UIButton()
        postButton.setTitle("Post", for: .normal)
        postButton.backgroundColor = .gray
        postButton.addTarget(self, action: #selector(postShow), for: .touchUpInside)
        
        return postButton
    }()
    
    @objc private func postShow() {
        let postVC = PostViewController()
        navigationController?.pushViewController(postVC, animated: true)
    }
    
                          
}
