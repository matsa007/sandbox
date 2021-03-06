//
//  ViewController.swift
//  ImgLoader
//
//  Created by Сергей Матвеенко on 09.01.2022.
//

import UIKit

class ViewController: UIViewController {
    
    private let firstVcButton = UIButton(type: .system)
    private let navVC = UINavigationController(rootViewController: PreviewViewController())

    override func viewDidLoad() {
        
        firstVcButtonSetup()
        view.backgroundColor = .lightGray
        navVC.navigationBar.isHidden = true
        super.viewDidLoad()
    }

    private func firstVcButtonSetup() {
        
        let button = firstVcButton
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Go to wallpapers =>", for: .normal)
        button.backgroundColor = .cyan
        button.setTitleColor(.darkGray, for: .normal)
        button.titleLabel!.font = .systemFont(ofSize: 15, weight: .heavy)
        button.clipsToBounds = true
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(firstVcButtonTapped), for: .touchUpInside)
               
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: view.topAnchor, constant: 700),
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50)
        ])
    }
}

extension ViewController {
    
    @objc private func firstVcButtonTapped() {
        
        navVC.modalPresentationStyle = .fullScreen
        self.dismiss(animated: true, completion: nil)
        present(navVC, animated: true, completion: nil)
    }
}
