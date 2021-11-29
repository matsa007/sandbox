//
//  SecondWithButtonViewController.swift
//  StudentList
//
//  Created by Сергей Матвеенко on 26.11.2021.
//

import UIKit

class SecondWithButtonViewController: UIViewController {
    
    @IBOutlet weak var selectButton: UIButton!
    @IBAction func selBT(_ sender: Any) {}
    
    var dataSourceNew = Set<String> ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? ViewController {
            vc.delegate = self
        }
    }
}



extension SecondWithButtonViewController: VCDelegate {
    func selectedStudent (_ name: String) {
        selectButton.setTitle(name, for: .normal)
        print("title - \(name)")
        dataSourceNew.update(with: name)
        print(dataSourceNew)
        return title = name
    }
}


