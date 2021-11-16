//
//  ManualLayoutCalculatorViewController.swift
//  newCalc
//
//  Created by Сергей Матвеенко on 16.11.2021.
//

import UIKit

class ManualLayoutCalculatorViewController: AbstractCalculatorViewController {
    
    override var displayLabel: UILabel! {
        set {
            
        }
        
        get {
            return manualDisplayLabel
        }
    }
    
    let manualDisplayLabel: UILabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        createUI()
    }
    
    func createUI() {
        addButtons()
    }
    
    func addButtons() {
        let equalButton = BinaryOperatorButton(type: .custom)
        equalButton.addTarget(self, action: #selector(equalOperatorButtonTapped), for: .touchUpInside)
        equalButton.setTitle("=", for: .normal)
        equalButton.setTitleColor(equalButton.selectedColor, for: .normal)
        equalButton.setTitleColor(equalButton.defaultColor, for: .selected)
        equalButton.backgroundColor = equalButton.defaultColor
        equalButton.titleLabel?.font = UIFont.systemFont(ofSize: 46, weight: .semibold)
        
        equalButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(equalButton)
        
        NSLayoutConstraint.activate([
            equalButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            equalButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            equalButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.25, constant: -25),
            equalButton.heightAnchor.constraint(equalTo: equalButton.widthAnchor)
        ])
        
        let decimalSeparatorButton = DigitButton(type: .custom)
        decimalSeparatorButton.addTarget(self, action: #selector(decimalSeparatorButtonTapped), for: .touchUpInside)
        decimalSeparatorButton.setTitle(CalculatorLogic.formatter.decimalSeparator, for: .normal)
        decimalSeparatorButton.setTitleColor(DigitButton.defaultTextColor, for: .normal)
        decimalSeparatorButton.backgroundColor = DigitButton.defaultBackgroundColor
        decimalSeparatorButton.titleLabel?.font = DigitButton.font
        decimalSeparatorButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(decimalSeparatorButton)
        
        NSLayoutConstraint.activate([
            decimalSeparatorButton.trailingAnchor.constraint(equalTo: equalButton.leadingAnchor, constant: -20),
            decimalSeparatorButton.bottomAnchor.constraint(equalTo: equalButton.bottomAnchor),
            decimalSeparatorButton.widthAnchor.constraint(equalTo: equalButton.widthAnchor),
            decimalSeparatorButton.heightAnchor.constraint(equalTo: equalButton.heightAnchor)
        ])
        
        let digit0Button = DigitButton.generate(title: "0")
        digit0Button.addTarget(self, action: #selector(digitButtonTapped), for: .touchUpInside)
        
        view.addSubview(digit0Button)
        
        NSLayoutConstraint.activate([
            digit0Button.trailingAnchor.constraint(equalTo: decimalSeparatorButton.leadingAnchor, constant: -20),
            digit0Button.bottomAnchor.constraint(equalTo: equalButton.bottomAnchor),
            digit0Button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            digit0Button.heightAnchor.constraint(equalTo: equalButton.heightAnchor)
        ])
        
        
        manualDisplayLabel.font = UIFont.systemFont(ofSize: 70)
        manualDisplayLabel.textAlignment = .right
        manualDisplayLabel.textColor = .white
        manualDisplayLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(manualDisplayLabel)
        
        NSLayoutConstraint.activate([
            manualDisplayLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            manualDisplayLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            manualDisplayLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        ])
    }
}
