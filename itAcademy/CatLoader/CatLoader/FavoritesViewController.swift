//
//  FavoritesViewController.swift
//  CatLoader
//
//  Created by Сергей Матвеенко on 22.01.2022.
//

import UIKit

class FavoritesViewController: UIViewController, UITableViewDataSource {
    
    
    
    let tableView = UITableView()
//    lazy var arrPP = [UIImage]()
    var arrPP:Array <UIImage> = [] {
            didSet {
                tableView.reloadData()
            }
        }
    let backButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        
        
        
        
    
        tableViewSetup()
        view.backgroundColor = .purple
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        backButtonSetup()
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
        
        
    }
    
    
    
    func tableViewSetup() {
        view.addSubview(tableView)
        tableView.reloadData()
        
        let vc = PreviewViewController()
        vc.closure = { [weak self] img in
            self?.arrPP.append(img)
            print(img)
            print("Eto novi massiv na FVC \(self!.arrPP))")
//            vc.dismiss(animated: true, completion: nil)
          }
        
        tableView.backgroundColor = .gray
        tableView.rowHeight = 22
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        print("Na fav vidit massiv \(arrPP)")
        
        
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 110),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0)
        ])
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        return arrPP.count
    }
    
   
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
       
        
        cell.imageView?.image = arrPP[indexPath.row]
        //        cell.textLabel?.text = "\(arrayKK[indexPath.row])"
        
        return cell
    }
    
    
    
    
    
}

extension FavoritesViewController {
    
    @objc func backButtonTapped() {
        self.dismiss(animated: true, completion: nil)
    }
    
    
}
