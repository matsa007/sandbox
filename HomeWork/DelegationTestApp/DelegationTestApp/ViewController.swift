//
//  ViewController.swift
//  DelegationTestApp
//
//  Created by Сергей Матвеенко on 01.01.2022.
//

import UIKit

protocol ChoosedPerson {
    func choosedPerson()
}

class ViewController: UIViewController {
    
//    let navVC = UINavigationController(rootViewController: ViewController())
    let firstVcTableView = UITableView()
    let firstVcChooseButton = UIButton(type: .system)
    var data = firstData()

    override func viewDidLoad() {
//        navVC.isNavigationBarHidden = true
        firstVcChooseButtonSetupConstraints()
        firstVcTableViewSetupConstraints()
        super.viewDidLoad()
    }

    // MARK: - UI-objects view properties
    
    private func firstVcChooseButtonSetupView() {
//        let navVC = UINavigationController(rootViewController: UIViewController())
        firstVcChooseButton.tintColor = .darkGray
        firstVcChooseButton.setTitle("Go to result TableView", for: .normal)
        firstVcChooseButton.titleLabel?.font = .systemFont(ofSize: 15)
        firstVcChooseButton.backgroundColor = .cyan
        firstVcChooseButton.clipsToBounds = true
//        firstVcChooseButton.addTarget(self, action: #selector(firstVcChooseButtonTapped), for: .touchUpInside)
    }
    
    private func firstVcTableViewSetupView() {
        firstVcTableView.dataSource = self
        firstVcTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    // MARK: - UI-objects constraint properties
    
    private func firstVcChooseButtonSetupConstraints() {
        view.addSubview(firstVcChooseButton)
        firstVcChooseButton.translatesAutoresizingMaskIntoConstraints = false
        firstVcChooseButtonSetupView()
        
        NSLayoutConstraint.activate([
            firstVcChooseButton.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            firstVcChooseButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            firstVcChooseButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            firstVcChooseButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        ])
    }
    
    private func firstVcTableViewSetupConstraints() {
        view.addSubview(firstVcTableView)
        firstVcTableView.translatesAutoresizingMaskIntoConstraints = false
        firstVcTableViewSetupView()
        
        NSLayoutConstraint.activate([
            firstVcTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            firstVcTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            firstVcTableView.bottomAnchor.constraint(equalTo: firstVcChooseButton.topAnchor, constant: -20),
            firstVcTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5)
        ])
    }
    
    
    
    
    
    
}

// MARK: - TableView Data


extension ViewController:UITableViewDataSource,UITableViewDelegate, ChoosedPerson {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.firstDataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data.firstDataArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
   
}
