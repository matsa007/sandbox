//
//  PreviewViewController.swift
//  CatLoader
//
//  Created by Сергей Матвеенко on 22.01.2022.
//

import UIKit

class PreviewViewController: UIViewController {
    
    private let imageView = UIImageView()
    let datasrc = DataSource()
    let imageData = UIImage()
    let favoritesListButton = UIButton(type: .system)
    let addTofavoritesListButton = UIButton(type: .system)
    var favoritesCounter = 0
    
    override func viewDidLoad() {
        imageViewSetup()
        favoritesListButtonSetup()
        addTofavoritesListButtonSetup()
        view.backgroundColor = .cyan
        super.viewDidLoad()
        
    }
    
    func imageViewSetup() {
        let image = imageView
        let urlUrl = URL(string: datasrc.urlStr)

        DispatchQueue.global(qos: .utility).async {
            let urlData = try? Data(contentsOf: urlUrl!)
//            DispatchQueue.main.async {
//            let fvc = FavoritesViewController()
//            fvc.arrayKK.append(UIImage(data: urlData!)!)
//            }
           
            
            DispatchQueue.main.async {
                [weak self] in self?.imageView.image = UIImage(data: urlData!)
            }
            
            
        }
        
        
        image.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        
        
        
        
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            image.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            image.bottomAnchor.constraint(equalTo: view.topAnchor, constant: 500),
            image.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50)
        ])
    }
    
    private func favoritesListButtonSetup() {
        let button = favoritesListButton
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Go To Favorites ☆", for: .normal)
        button.backgroundColor = .darkGray
        button.addTarget(self, action: #selector(favoritesListButtonTapped), for: .touchUpInside)
        view.addSubview(button)
        
        
        
        
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: view.topAnchor, constant: 700),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            button.bottomAnchor.constraint(equalTo: view.topAnchor, constant: 750),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50)
        ])
        
    }
    
    
    private func addTofavoritesListButtonSetup() {
        
        let button = addTofavoritesListButton
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("☆", for: .normal)
        button.backgroundColor = .clear
        button.tintColor = .red
        button.titleLabel?.font = .systemFont(ofSize: 33)
        view.addSubview(button)
        
        
        
        
        
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: view.topAnchor, constant: 450),
            button.leadingAnchor.constraint(equalTo: view.trailingAnchor, constant: -110),
            button.bottomAnchor.constraint(equalTo: view.topAnchor, constant: 500),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50)
        ])
        
    }
   
    
    
}








extension PreviewViewController {
    
    @objc func favoritesListButtonTapped() {
        let fvc = FavoritesViewController()
        
        
        self.present(fvc, animated: true, completion: nil)
        
        
    }
    
    
}

extension PreviewViewController {
    
    
    
    
}
