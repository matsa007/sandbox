//
//  PreviewViewController.swift
//  ImgLoader
//
//  Created by Сергей Матвеенко on 09.01.2022.
//

import UIKit

class PreviewViewController: UIViewController {
    
    private let imageView = UIImageView()
    private let imageDataSource = DataSource()
    private let backButton = UIButton(type: .system)
    private var count = 0

    override func viewDidLoad() {
        imageViewSetup()
        backButtonSetup()
        imageViewLoadingData()
        view.backgroundColor = .lightGray
        super.viewDidLoad()
    }
    
    private func imageViewSetup() {
        
        let imageZone = imageView
        
        view.addSubview(imageZone)
        imageZone.translatesAutoresizingMaskIntoConstraints = false
        imageZone.backgroundColor = .lightGray
        
        NSLayoutConstraint.activate([
            imageZone.topAnchor.constraint(equalTo: view.topAnchor, constant: 75),
            imageZone.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            imageZone.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            imageZone.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0)
        ])
    }
    
    private func backButtonSetup() {
        let button = backButton
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .clear
        button.setTitle("< Back", for: .normal)
        button.setTitleColor(.darkGray, for: .normal)
        button.titleLabel!.font = .systemFont(ofSize: 15, weight: .heavy)
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        button.addTarget(self, action: #selector(changeCount), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            button.bottomAnchor.constraint(equalTo: view.topAnchor, constant: 70),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -300)
        ])
        
    }
    
    private func imageViewLoadingData() {
        let url = URL(string: imageDataSource.url[0]!)
        DispatchQueue.global(qos: .userInitiated).async {
            if let data = try? Data(contentsOf: url!) {
                DispatchQueue.main.async {
                    [weak self] in self?.imageView.image = UIImage(data: data)
                }
            }
        }
    }
}

extension PreviewViewController {
    
    @objc private func backButtonTapped() {
        
        let firstVc = ViewController()
        self.dismiss(animated: true, completion: nil)
        self.present(firstVc, animated: true, completion: nil)
    }
    
    @objc private func changeCount() {
        
        if count < imageDataSource.url.count {
            count = count + 1
        }
        
        if count == imageDataSource.url.count {
            count = 0
        }

        let url = URL(string: imageDataSource.url[count]!)
        DispatchQueue.global(qos: .userInitiated).async {
            if let data = try? Data(contentsOf: url!) {
                DispatchQueue.main.async {
                    [weak self] in self?.imageView.image = UIImage(data: data)
                }
            }
        }
    }
}
