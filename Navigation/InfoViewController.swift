//
//  InfoViewController.swift
//  Navigation
//
//  Created by Вячеслав Мартынов on 15.05.2022.
//

import UIKit

class InfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeAlertButton()
        view.backgroundColor = .white
    }
    
    func makeAlertButton() {
        let alertButton = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 200))
        alertButton.center = view.center
        alertButton.setTitle("Alert!", for: .normal)
        alertButton.backgroundColor = .darkGray
        alertButton.addTarget(self, action: #selector(alertShow), for: .touchUpInside)
        view.addSubview(alertButton)
    }
 
    @objc private func alertShow() {
        let alert = UIAlertController(title: "Alert", message: "You have been ALERTED!", preferredStyle: .alert)
        let yesAction = UIAlertAction(title: "Ok", style: .default) { _ in
            print("I admit being alerted")
        }
        let noAction = UIAlertAction(title: "OH NO!", style: .cancel) { _ in
            print("I have never heard any alerts!")
        }
        
        alert.addAction(yesAction)
        alert.addAction(noAction)
        present(alert, animated: true)
    }
}
