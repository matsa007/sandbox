//
//  AvatarsViewController.swift
//  AvatarLoader
//
//  Created by Сергей Матвеенко on 16.01.2022.
//

import UIKit

class AvatarsViewController: UIViewController {
    
    let backButton = UIButton(type: .system)
    let imageView = UIImageView()


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        backButtonSetup()
        imageViewSetup()

    }
    
    func backButtonSetup() {
        let button = backButton
        
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("< Back", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: view.topAnchor, constant: 35),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            button.bottomAnchor.constraint(equalTo: view.topAnchor, constant: 65),
            button.trailingAnchor.constraint(equalTo: view.leadingAnchor, constant: 70)
        ])
    }
    
    func imageViewSetup() {
        let image = imageView
        
        view.addSubview(image)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .cyan
        image.tintColor = .white
        
        
        NSLayoutConstraint.activate([
        
            image.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 10),
            image.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            image.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            image.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        
        
    }
    
    
    

}

extension AvatarsViewController {
    
    @objc func backButtonTapped() {
        let vc = ViewController()
        self.dismiss(animated: true, completion: nil)
        self.present(vc, animated: true, completion: nil)
    }
}
