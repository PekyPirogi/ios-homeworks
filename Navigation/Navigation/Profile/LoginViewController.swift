//
//  LoginViewController.swift
//  Navigation
//
//  Created by Вячеслав Мартынов on 18.05.2022.
//

import Foundation
import UIKit



class LoginViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        navigationController?.navigationBar.isHidden = true
        
        [logo, logInButton].forEach {view.addSubview($0) }
        addLoginStackView()
        
        NSLayoutConstraint.activate([
            logo.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 120),
            logo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logo.widthAnchor.constraint(equalToConstant: 100),
            logo.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            logInButton.topAnchor.constraint(equalTo: loginStackView.bottomAnchor, constant: 16),
            logInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logInButton.widthAnchor.constraint(equalTo: loginStackView.widthAnchor),
            logInButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        
        
    }
    
    private let logo: UIImageView = {
        let logo = UIImageView(image: UIImage(named: "logo"))
        logo.translatesAutoresizingMaskIntoConstraints = false
        
        return logo
    }()
    
    private var loginStackView: UIStackView = {
       let loginSV = UIStackView()
        loginSV.translatesAutoresizingMaskIntoConstraints = false
        loginSV.axis = .vertical
        loginSV.distribution = .fillEqually
        loginSV.spacing = 1
        loginSV.backgroundColor = .lightGray
        loginSV.layer.cornerRadius = 10
        loginSV.layer.borderWidth = 0.5
        loginSV.layer.borderColor = UIColor.lightGray.cgColor
        
        return loginSV
    }()
    
    private var login: UITextField = {
        let login = UITextField()
        login.translatesAutoresizingMaskIntoConstraints = false
        login.backgroundColor = .systemGray6
        //login.tintColor = .accentColor вот эту часть макета вообще не понял, гуглинг говорит, что тинт и акцент - одно и тоже, только акцент для СвифтЮай
        login.autocapitalizationType = .none
        login.textColor = .black
        login.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        login.placeholder = "Email or phone"
        
        return login
    }()
    
    private var password: UITextField = {
        let pass = UITextField()
        pass.translatesAutoresizingMaskIntoConstraints = false
        pass.backgroundColor = .systemGray6
        pass.placeholder = "Password"
        pass.isSecureTextEntry = true
        
        return pass
    }()
    
    private func addLoginStackView() {
        view.addSubview(loginStackView)
        
        [login, password].forEach { loginStackView.addArrangedSubview($0) }
        
        NSLayoutConstraint.activate([
            loginStackView.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 120),
            loginStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            loginStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            loginStackView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    private let logInButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = logInColor
        button.layer.cornerRadius = 10
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Log In", for: .normal)
        switch button.state {
        case .normal: button.alpha = 1
        case .selected: button.alpha = 0.8
        case .highlighted: button.alpha = 0.8
        case .disabled: button.alpha = 0.8
        default: button.alpha = 1
        }
        button.addTarget(self, action: #selector(loginPressed), for: .touchUpInside)
        
        return button
    }()
    
    @objc private func loginPressed() {
        let profileVC = ProfileViewController()
        navigationController?.pushViewController(profileVC, animated: true)
    }
    
    
    
}
