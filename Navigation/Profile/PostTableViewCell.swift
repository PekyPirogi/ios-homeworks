//
//  ProfileTableViewCell.swift
//  Navigation
//
//  Created by Вячеслав Мартынов on 19.05.2022.
//

import UIKit

struct Post {
    var author: String
    var description: String
    var image: String
    var likes: Int
    var views: Int
    var id: Int
}

protocol PostTableViewDelegate: AnyObject {
    func addLike(id: Int)
    func showPost(id: Int)
    func deletePost(id: Int)
}


class PostTableViewCell: UITableViewCell {
    
    weak var postTableViewDelegate: PostTableViewDelegate?
    
    private var authorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        label.numberOfLines = 2
        
        return label
    }()
    
    private var postImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.backgroundColor = .black
        
        return image
    }()
    
    private var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .systemGray
        label.numberOfLines = 0
        
        return label
    }()
    
    private var likesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        
        return label
    }()
    
    private var viewsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        
        return label
    }()
    
    private var id: Int = {
        let id = Int()
        
        return id
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
        setupGestures()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(_ postCell: Post) {
        authorLabel.text = postCell.author
        descriptionLabel.text = postCell.description
        postImageView.image = UIImage(named: postCell.image)
        likesLabel.text = "Likes:" + " " + String(postCell.likes)
        viewsLabel.text = "Views:" + " " + String(postCell.views)
        id.self = postCell.id
    }
    
    private func setupGestures() {
        let likeTapGesture = UITapGestureRecognizer(target: self, action: #selector(likeTapAction))
        likesLabel.isUserInteractionEnabled = true
        likesLabel.addGestureRecognizer(likeTapGesture)
        
        let postTapGesture = UITapGestureRecognizer(target: self, action: #selector(postTapAction))
        postImageView.isUserInteractionEnabled = true
        postImageView.addGestureRecognizer(postTapGesture)
        
        let postSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(postSwipeAction))
        postSwipeGesture.direction = .left
        postImageView.addGestureRecognizer(postSwipeGesture)
    }
    
    @objc private func likeTapAction() {
        postTableViewDelegate?.addLike(id: id)
        //likesLabel.isUserInteractionEnabled = false попытался выключить возможность поставить повторный лайк, в симуляторе работает не корректно, не понимаю почему
    }
    
    @objc private func postTapAction() {
        postTableViewDelegate?.showPost(id: id)
    }
    
    @objc private func postSwipeAction() {
        postTableViewDelegate?.deletePost(id: id)
    }
    
    private func layout() {
        [authorLabel, postImageView, descriptionLabel, likesLabel, viewsLabel].forEach { contentView.addSubview($0) }
        
        NSLayoutConstraint.activate([
            authorLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            authorLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            authorLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            postImageView.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 16),
            postImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            postImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            postImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            postImageView.heightAnchor.constraint(equalTo: postImageView.widthAnchor),
        ])
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: 16),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            likesLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            likesLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            likesLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            viewsLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            viewsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            viewsLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -16)
        ])
    
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
