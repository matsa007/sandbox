//
//  FavViewController.swift
//  CatLoader
//
//  Created by Сергей Матвеенко on 30.01.2022.
//

import UIKit

class FavViewController: UIViewController, UICollectionViewDataSource {
    
    
//    let buttonCount = UIButton(type: .system)
    let colView = UICollectionView(frame: .init(x: 50, y: 50, width: 500, height: 500) , collectionViewLayout: UICollectionViewFlowLayout())
    
    var arrayOfFavoriteImg:Array <UIImage> = [] {
        didSet {
            colView.reloadData()
        }
    }
    
    
    
    
    
    override func viewDidLoad() {
        view.backgroundColor = .placeholderText
        colView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "CollCell")
        
        colView.dataSource = self

//        buttonCountSetup()
        colViewSetup()
        super.viewDidLoad()

    }
    
//    func buttonCountSetup() {
//        let button = buttonCount
//        button.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(button)
//        button.tintColor = .white
//        button.backgroundColor = .blue
//        button.titleLabel?.text = "Show Array"
//        button.addTarget(self, action: #selector(buttonCountTapped), for: .touchUpInside)
//
//        NSLayoutConstraint.activate([
//            button.topAnchor.constraint(equalTo: view.topAnchor, constant: 500),
//            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
//            button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
//            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50)
//        ])
//
//
//    }
    
    func colViewSetup() {
        let col = colView
        col.layer.borderWidth = 10
        col.layer.borderColor = .init(red: 204/255, green: 0, blue: 102/255, alpha: 1)
        print(arrayOfFavoriteImg.count)
        col.translatesAutoresizingMaskIntoConstraints = false
        col.backgroundColor = .clear
        
        view.addSubview(col)
        
        NSLayoutConstraint.activate([
            col.topAnchor.constraint(equalTo: view.topAnchor, constant: 110),
            col.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            col.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            col.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0)
        ])
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        arrayOfFavoriteImg.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 150, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = colView.dequeueReusableCell(withReuseIdentifier: "CollCell", for: indexPath)
        var config = UIListContentConfiguration.cell()
        config.image = arrayOfFavoriteImg[indexPath.row]
        cell.contentConfiguration = config
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
        layout.itemSize = .init(width: 80, height: 130)
        cell.backgroundColor = .cyan
        layout.scrollDirection = .vertical
        colView.collectionViewLayout = layout
        
        return cell
    }
    
    

  
}

extension FavViewController:UICollectionViewDelegateFlowLayout {
    
    
    
    
//    @objc func buttonCountTapped() {
//        buttonCount.backgroundColor = .gray
//    }
}
