//
//  ViewController.swift
//  StudentsList
//
//  Created by Сергей Матвеенко on 16.11.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

let dataSource = ["01", "02", "03"]

override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.dataSource = self
}

}

extension ViewController: UITableViewDataSource {
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 10
}

func tableView(_ tableView: UITableView, cellForRowAt IndexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "StudentCell", for: IndexPath) as! StudentCell
    cell.nameLabel.text = dataSource[IndexPath.row]
    
    return cell
}
}

