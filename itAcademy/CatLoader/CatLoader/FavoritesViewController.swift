//
//  FavoritesViewController.swift
//  CatLoader
//
//  Created by Сергей Матвеенко on 22.01.2022.
//

import UIKit

class FavoritesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let tableView = UITableView()
    let backButton = UIButton(type: .system)
    var arrPP:Array <UIImage> = [] {
            didSet {
                tableView.reloadData()
            }
        }
    
    
    override func viewDidLoad() {

        tableViewSetup()
        view.backgroundColor = .purple
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        backButtonSetup()
        tableView.rowHeight = 50
        super.viewDidLoad()
        
    }
    
    
    func backButtonSetup() {
        let button = backButton
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("<= Back to Cats", for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 15
        button.backgroundColor = .green
        button.tintColor = .white
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: view.topAnchor, constant: 700),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            button.bottomAnchor.constraint(equalTo: view.topAnchor, constant: 750),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50)
        ])
    }
    
    
    
    func tableViewSetup() {
        view.addSubview(tableView)
        
        tableView.backgroundColor = view.backgroundColor
        tableView.rowHeight = 1000
        tableView.cellLayoutMarginsFollowReadableWidth = true
        tableView.translatesAutoresizingMaskIntoConstraints = false
        self.tableView.centerXAnchor.anchorWithOffset(to: super.view.centerXAnchor)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 110),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0)
        ])
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrPP.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        
        cell.backgroundColor = view.backgroundColor
        cell.imageView?.image = arrPP[indexPath.row]
        return cell
    }
 
}

extension FavoritesViewController {
    
    @objc func backButtonTapped() {
        self.dismiss(animated: true, completion: nil)
    }
}
