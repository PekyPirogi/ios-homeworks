//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Вячеслав Мартынов on 15.05.2022.
//

import UIKit

let post1 = Post(author: "Doge", description: "I am a fu**ing pillow!", image: "post1", likes: 999, views: 999)
let post2 = Post(author: "Doge", description: "Haters gonna hate", image: "post2", likes: 666, views: 666)
let post3 = Post(author: "WannaBeYourDog", description: "Do u like ahegao?", image: "post3", likes: 14356, views: 50435)
let post4 = Post(author: "Kimiko", description: "Japan is awesome!", image: "post4", likes: 23, views: 35)

var postFeed = [ post1, post2, post3, post4 ]

class ProfileViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(profileView)
        navigationController?.navigationBar.isTranslucent = true
        view.backgroundColor = .white
        
        NSLayoutConstraint.activate([
            profileView.topAnchor.constraint(equalTo: view.topAnchor),
            profileView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profileView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
    }
    
    private lazy var profileView: UITableView = {
        let profileView = UITableView(frame: .zero, style: .grouped)
        profileView.translatesAutoresizingMaskIntoConstraints = false
        profileView.dataSource = self
        profileView.delegate = self
        profileView.register(ProfileTableViewCell.self, forCellReuseIdentifier: ProfileTableViewCell.identifier)
        
        return profileView
    }()
    
}

//MARK: - UITableViewDataSource

extension ProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postFeed.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProfileTableViewCell.identifier, for: indexPath) as! ProfileTableViewCell
        cell.setupCell(postFeed[indexPath.row])
        
        return cell
    }
    
}

//MARK: - UITableViewDelegate
extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let header = ProfileHeaderView()
        
        return header
    }
    
}

extension UIView {
    static var identifier: String {
        return String(describing: self)
    }
}
