//
//  SecondWithButtonViewController.swift
//  StudentList
//
//  Created by Сергей Матвеенко on 26.11.2021.
//

import UIKit

class SecondWithButtonViewController: UIViewController {

    @IBOutlet weak var selectButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension SecondWithButtonViewController: VCDelegate {
    func selectedStudent (_ name: String) {
        selectButton.setTitle(name, for: .normal)
    }
    
}
