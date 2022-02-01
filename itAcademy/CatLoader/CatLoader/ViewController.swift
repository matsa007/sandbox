//
//  ViewController.swift
//  CatLoader
//
//  Created by Сергей Матвеенко on 22.01.2022.
//

import UIKit

class ViewController: UIViewController {
    
    private let downloadButton = UIButton(type: .system)
//    let navvc = UINavigationController(rootViewController: PreviewViewController())
//    var vc = PreviewViewController()
//
    override func viewDidLoad() {
        view.backgroundColor = .lightGray
        downloadButtonsetup()
        super.viewDidLoad()
    }
    
    private func downloadButtonsetup() {
        let button = downloadButton
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .darkGray
        button.setTitle("Download cat image =>", for: .normal)
        button.titleLabel?.textColor = .yellow
        button.clipsToBounds = true
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(downloadButtonTapped), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: view.topAnchor, constant: 700),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            button.bottomAnchor.constraint(equalTo: view.topAnchor, constant: 750),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50)
        ])
        
        
        
    }
    
    
}

extension ViewController {
    @objc func downloadButtonTapped() {
        let vc = PreviewViewController()
        self.dismiss(animated: true, completion: nil)
        self.present(vc, animated: true, completion: nil)
//        navvc.modalPresentationStyle = .fullScreen
//
//        present(navvc, animated: true, completion: nil)
    }
}
