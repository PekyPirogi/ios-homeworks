//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Вячеслав Мартынов on 15.05.2022.
//

import UIKit

let post1 = Post(author: "Doge", description: "I am a fu**ing pillow!", image: "post1", likes: 999, views: 999, id: 0)
let post2 = Post(author: "Doge", description: "Haters gonna hate", image: "post2", likes: 666, views: 666, id: 1)
let post3 = Post(author: "WannaBeYourDog", description: "Do u like ahegao?", image: "post3", likes: 14356, views: 50435, id: 2)
let post4 = Post(author: "Kimiko", description: "Japan is awesome!", image: "post4", likes: 23, views: 35, id: 3)

var postFeed = [ post1, post2, post3, post4 ]

class ProfileViewController: UIViewController {
    
    private lazy var profileView: UITableView = {
        let profileView = UITableView(frame: .zero, style: .grouped)
        profileView.translatesAutoresizingMaskIntoConstraints = false
        profileView.dataSource = self
        profileView.delegate = self
        profileView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.identifier)
        profileView.register(PhotosTableViewCell.self, forCellReuseIdentifier: PhotosTableViewCell.identifier)
        
        
        return profileView
    }()
    
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
}

//MARK: - UITableViewDataSource

extension ProfileViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
                return 1
        } else {
                return postFeed.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: PhotosTableViewCell.identifier, for: indexPath) as! PhotosTableViewCell
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier, for: indexPath) as! PostTableViewCell
            cell.setupCell(postFeed[indexPath.row])
            cell.postTableViewDelegate = self
            
            return cell
        }
    }
    
    
}

//MARK: - UITableViewDelegate
extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        switch section {
            
        case 0:
            let header = ProfileHeaderView()
            return header
        default:
            
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            let height = tableView.sectionHeaderHeight
            
            return height
        }   else {
            return 0.00001
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        0.000001
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        nil
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            let photosVC = PhotosViewController()
            navigationController?.pushViewController(photosVC, animated: true)
        }
    }
}

extension UIView {
    static var identifier: String {
        return String(describing: self)
    }
}

extension ProfileViewController: PostTableViewDelegate {
    func addLike(id:  Int) {
        var postIndex = 0
        print(postFeed[postIndex].likes)
        for (index, value) in postFeed.enumerated() {
            if id == value.id {
                postIndex = index
            }
        }
        postFeed[postIndex].likes += 1
        print(postFeed[postIndex].likes)
        profileView.reloadData()
    }
    
    func showPost(id: Int) {
        var postIndex = 0
        for (index, value) in postFeed.enumerated() {
            if id == value.id {
                postIndex = index
            }
        }
        let postView = ProfilePostViewController()
        let post = postFeed[postIndex]
        postView.setupPostView(author: post.author, image: post.image, description: post.description, likes: post.likes, views: post.views)
        present(postView, animated: true) {
            postFeed[postIndex].views += 1
            self.profileView.reloadData()
        }
    }
}
