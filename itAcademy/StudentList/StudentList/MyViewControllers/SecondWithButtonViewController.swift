//
//  SecondWithButtonViewController.swift
//  StudentList
//
//  Created by Сергей Матвеенко on 26.11.2021.
//

import UIKit

class SecondWithButtonViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet weak var secondTableView: UITableView!
    @IBOutlet weak var selectButton: UIButton!
    @IBAction func selBT(_ sender: Any) {}

    var dataSourceNew: [String] = [] {
        didSet {
            secondTableView.reloadData()
        }
    }
       
    override func viewDidLoad() {
        super.viewDidLoad()
        secondTableView.delegate = self
        secondTableView.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? ViewController {
            vc.delegate = self
        }
    }
}

extension SecondWithButtonViewController: VCDelegate {
    func selectedStudent(_ name: String) {
        selectButton.setTitle(name, for: .normal)
        print("title - \(name)")
        if dataSourceNew.contains(name) == false {
            dataSourceNew.append(name)
        }
    }
}

extension SecondWithButtonViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSourceNew.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = secondTableView.dequeueReusableCell(withIdentifier: "SecondCell", for: indexPath) as! SecondStudentCell
        
        cell.secondNameLabel!.text = dataSourceNew[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            secondTableView.beginUpdates()
            dataSourceNew.remove(at: indexPath.row)
            secondTableView.deleteRows(at: [indexPath], with: .fade)
            secondTableView.endUpdates()
        }
    }
}

