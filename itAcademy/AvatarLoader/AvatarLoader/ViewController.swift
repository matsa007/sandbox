//
//  ViewController.swift
//  AvatarLoader
//
//  Created by Сергей Матвеенко on 16.01.2022.
//

import UIKit

class ViewController: UIViewController {
    
    let nextVcButton = UIButton(type: .system)
    let navVC = UINavigationController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        
       

        nextVcButtonSetup()
        
    }
    
    func nextVcButtonSetup() {
        let button = nextVcButton
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .red
        button.setTitle("Go to Git avatars =>", for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 15
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(nextVcButtonTapped), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: view.topAnchor, constant: 400),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -400),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50)
        ])
    }
    


}

extension ViewController {
    
    @objc func nextVcButtonTapped() {
        let vc = AvatarsViewController()
        let navVC = UINavigationController(rootViewController: vc)
        
        navVC.isNavigationBarHidden = true
        navVC.navigationBar.backgroundColor = .green
        
        navVC.modalPresentationStyle = .fullScreen
        self.dismiss(animated: true, completion: nil)
        present(navVC, animated: true, completion: nil)   
    }
    
}
