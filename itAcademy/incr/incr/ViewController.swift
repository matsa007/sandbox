//
//  ViewController.swift
//  incr
//
//  Created by Сергей Матвеенко on 22.10.2021.
//

import UIKit

var counterLabel = 0
let labelPhrase = "Counter: "

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.textColor = .darkGray
    }
 
    @IBAction func upperButton(_ sender: Any) {
        counterLabel+=1
        label.text = "\(labelPhrase) + \(counterLabel)"
    }
    
    @IBAction func lowerButton(_ sender: Any) {
        counterLabel-=1
        label.text = labelPhrase + String(counterLabel)
    }
}

