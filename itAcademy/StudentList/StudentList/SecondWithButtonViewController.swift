//
//  SecondWithButtonViewController.swift
//  StudentList
//
//  Created by Сергей Матвеенко on 26.11.2021.
//

import UIKit

class SecondWithButtonViewController: UIViewController {
    

    @IBOutlet weak var selectButton: UIButton!
    
    @IBAction func selBT(_ sender: Any) {
        
    }
    
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
    func selectedStudent (_ student: String) {
        selectButton.setTitle(student, for: .normal)
        print("title - \(student)")
        print("dscsc")
        return title = student
    }
}
