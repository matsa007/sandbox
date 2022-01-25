//
//  FavoritesViewController.swift
//  CatLoader
//
//  Created by Сергей Матвеенко on 22.01.2022.
//

import UIKit

class FavoritesViewController: UIViewController {
    
    let tableView = UITableView()
    
    var arrayKK:Array <UIImage> = []
    
    

    override func viewDidLoad() {
        
        
        tableViewSetup()
        view.backgroundColor = .purple
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        super.viewDidLoad()

    }
    
    func tableViewSetup() {
            view.addSubview(tableView)
            tableView.backgroundColor = .gray
            tableView.rowHeight = 22
            tableView.translatesAutoresizingMaskIntoConstraints = false
            tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
            
            NSLayoutConstraint.activate([
                tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 110),
                tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
                tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
                tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0)
            ])
        }
    
    
    
}

extension FavoritesViewController:UITableViewDataSource {
    
    
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayKK.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        cell.imageView?.image = arrayKK[indexPath.row]
//        cell.textLabel?.text = "\(arrayKK[indexPath.row])"
            return cell
    }
    
    
    
}
