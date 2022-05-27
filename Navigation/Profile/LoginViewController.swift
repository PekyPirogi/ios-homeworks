//
//  LoginViewController.swift
//  Navigation
//
//  Created by Вячеслав Мартынов on 18.05.2022.
//

import Foundation
import UIKit

private var currentLogin = "Doge"
private var currentPassword = "Password"

class LoginViewController: UIViewController {
    
    private let notificationCenter = NotificationCenter.default

    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        return scrollView
    }()
    
    private let contentView: UIView = {
        let content = UIView()
        content.translatesAutoresizingMaskIntoConstraints = false
        content.backgroundColor = .white
        
        return content
    }()
    
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
        login.autocapitalizationType = .none
        login.textColor = .black
        login.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        login.placeholder = "Email or phone"
        login.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 16))
        login.leftViewMode = .always
        
        return login
    }()
    
    private var password: UITextField = {
        let pass = UITextField()
        pass.translatesAutoresizingMaskIntoConstraints = false
        pass.backgroundColor = .systemGray6
        pass.placeholder = "Password"
        pass.isSecureTextEntry = true
        pass.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 16))
        pass.leftViewMode = .always
        
        return pass
    }()
    
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
    
    private let shortPassLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 10, weight: .regular)
        label.textColor = .black
        label.numberOfLines = 0
        label.text = "Too short for a password. Please try again"
        
        return label
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        notificationCenter.addObserver(self, selector: #selector(keyboardShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(keyboardHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @objc private func keyboardShow(notification: NSNotification) {
        if let kbdSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            scrollView.contentInset.bottom = kbdSize.height
            scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: kbdSize.height, right: 0)
        }
    }

    @objc private func keyboardHide() {
        scrollView.contentInset = .zero
        scrollView.verticalScrollIndicatorInsets = .zero
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        notificationCenter.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        notificationCenter.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
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
    
    @objc private func loginPressed() {
        let loginText = login.text ?? ""
        let passText = password.text ?? ""
        shortPassLabel.removeFromSuperview()
        
//        if passText.isEmpty == false || loginText.isEmpty == false {
//            if passText.count >= 6 && passText.isEmpty == false {
//                if loginText == currentLogin && passText == currentPassword {
//                    let profileVC = ProfileViewController()
//                    navigationController?.pushViewController(profileVC, animated: true)
//                } else {
//                    makeWrongLogAlert()
//                }
//            } else {
//                makeShortPassLabel()
//            }
//        } else  {
//            if loginText.isEmpty == true {
//                animateEmptyField(field: self.login)
//            } else if passText.isEmpty == true {
//                animateEmptyField(field: self.password)
//            }
//        }
        if loginText.isEmpty == true {
            animateEmptyField(field: self.login)
        } else {
            if loginText == currentLogin && passText == currentPassword {
                let profileVC = ProfileViewController()
                navigationController?.pushViewController(profileVC, animated: true)
            } else {
                if passText.isEmpty == false {
                    makeWrongLogAlert()
                }
            }
        }
        
        if passText.isEmpty == true {
            animateEmptyField(field: self.password)
        } else {
            if passText.count >= 6 {
                if loginText == currentLogin && passText == currentPassword {
                    let profileVC = ProfileViewController()
                    navigationController?.pushViewController(profileVC, animated: true)
                } else {
                    if loginText.isEmpty == false {
                    makeWrongLogAlert()
                    }
                }
            } else {
                if loginText.isEmpty == false {
                makeShortPassLabel()
                }
            }
        }
    }
    
    private func animateEmptyField(field: UITextField) {
        UITextField.animate(withDuration: 1) {
            field.backgroundColor = .systemRed
        } completion: { _ in
            UITextField.animate(withDuration: 2) {
                field.backgroundColor = .systemGray6
            }
        }
    }
    
    private func makeWrongLogAlert() {
        let alert = UIAlertController(title: "Sorry", message: "Wrong login or password", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Let's try again", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    private func makeShortPassLabel() {
        view.addSubview(shortPassLabel)
        
        NSLayoutConstraint.activate([
            shortPassLabel.topAnchor.constraint(equalTo: loginStackView.bottomAnchor, constant: 4),
            shortPassLabel.centerXAnchor.constraint(equalTo: loginStackView.centerXAnchor)
        ])
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = true
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        [logo, logInButton].forEach {contentView.addSubview($0) }
        addLoginStackView()
        
        NSLayoutConstraint.activate([
            logo.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 120),
            logo.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            logo.widthAnchor.constraint(equalToConstant: 100),
            logo.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            logInButton.topAnchor.constraint(equalTo: loginStackView.bottomAnchor, constant: 16),
            logInButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            logInButton.widthAnchor.constraint(equalTo: loginStackView.widthAnchor),
            logInButton.heightAnchor.constraint(equalToConstant: 50),
            logInButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        
        return true
    }
}
