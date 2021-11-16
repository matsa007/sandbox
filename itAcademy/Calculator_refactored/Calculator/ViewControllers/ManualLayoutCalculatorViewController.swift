//
//  ManualLayoutCalculatorViewController.swift
//  Calculator
//
//  Created by Sergey Matveenko on 13.11.21.
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
        
        let sumButton = BinaryOperatorButton(type: .custom)
        sumButton.tag = 102
        sumButton.addTarget(self, action: #selector(binaryOperandButtonTapped), for: .touchUpInside)
        sumButton.setTitle("+", for: .normal)
        sumButton.setTitleColor(sumButton.selectedColor, for: .normal)
        sumButton.setTitleColor(sumButton.defaultColor, for: .selected)
        sumButton.backgroundColor = sumButton.defaultColor
        sumButton.titleLabel?.font = UIFont.systemFont(ofSize: 46, weight: .semibold)
        
        sumButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(sumButton)
        
        NSLayoutConstraint.activate([
            sumButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            sumButton.bottomAnchor.constraint(equalTo: equalButton.topAnchor, constant: -20),
            sumButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.25, constant: -25),
            sumButton.heightAnchor.constraint(equalTo: sumButton.widthAnchor)
        ])
        
        let digit3Button = DigitButton.generate(title: "3")
        digit3Button.addTarget(self, action: #selector(digitButtonTapped), for: .touchUpInside)
        
        view.addSubview(digit3Button)
        
        NSLayoutConstraint.activate([
            digit3Button.trailingAnchor.constraint(equalTo: sumButton.leadingAnchor, constant: -20),
            digit3Button.bottomAnchor.constraint(equalTo: sumButton.bottomAnchor),
            digit3Button.heightAnchor.constraint(equalTo: equalButton.heightAnchor),
            digit3Button.widthAnchor.constraint(equalTo: equalButton.widthAnchor),
        ])
        
        let digit2Button = DigitButton.generate(title: "2")
        digit2Button.addTarget(self, action: #selector(digitButtonTapped), for: .touchUpInside)
        
        view.addSubview(digit2Button)
        
        NSLayoutConstraint.activate([
            digit2Button.trailingAnchor.constraint(equalTo: digit3Button.leadingAnchor, constant: -20),
            digit2Button.bottomAnchor.constraint(equalTo: digit3Button.bottomAnchor),
            digit2Button.heightAnchor.constraint(equalTo: equalButton.heightAnchor),
            digit2Button.widthAnchor.constraint(equalTo: equalButton.widthAnchor),
        ])
        
        let digit1Button = DigitButton.generate(title: "1")
        digit1Button.addTarget(self, action: #selector(digitButtonTapped), for: .touchUpInside)

        view.addSubview(digit1Button)

        NSLayoutConstraint.activate([
            digit1Button.trailingAnchor.constraint(equalTo: digit2Button.leadingAnchor, constant: -20),
            digit1Button.bottomAnchor.constraint(equalTo: digit2Button.bottomAnchor),
            digit1Button.heightAnchor.constraint(equalTo: equalButton.heightAnchor),
            digit1Button.widthAnchor.constraint(equalTo: equalButton.widthAnchor),
            digit1Button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
        
        let substructButton = BinaryOperatorButton(type: .custom)
        substructButton.tag = 103
        substructButton.addTarget(self, action: #selector(binaryOperandButtonTapped), for: .touchUpInside)
        substructButton.setTitle("-", for: .normal)
        substructButton.setTitleColor(substructButton.selectedColor, for: .normal)
        substructButton.setTitleColor(substructButton.defaultColor, for: .selected)
        substructButton.backgroundColor = substructButton.defaultColor
        substructButton.titleLabel?.font = UIFont.systemFont(ofSize: 46, weight: .semibold)
        
        substructButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(substructButton)
        
        NSLayoutConstraint.activate([
            substructButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            substructButton.bottomAnchor.constraint(equalTo: sumButton.topAnchor, constant: -20),
            substructButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.25, constant: -25),
            substructButton.heightAnchor.constraint(equalTo: substructButton.widthAnchor)
        ])
        
        let digit6Button = DigitButton.generate(title: "6")
        digit6Button.addTarget(self, action: #selector(digitButtonTapped), for: .touchUpInside)
        
        view.addSubview(digit6Button)
        
        NSLayoutConstraint.activate([
            digit6Button.trailingAnchor.constraint(equalTo: substructButton.leadingAnchor, constant: -20),
            digit6Button.bottomAnchor.constraint(equalTo: substructButton.bottomAnchor),
            digit6Button.heightAnchor.constraint(equalTo: equalButton.heightAnchor),
            digit6Button.widthAnchor.constraint(equalTo: equalButton.widthAnchor),
        ])
        
        let digit5Button = DigitButton.generate(title: "5")
        digit5Button.addTarget(self, action: #selector(digitButtonTapped), for: .touchUpInside)
        
        view.addSubview(digit5Button)
        
        NSLayoutConstraint.activate([
            digit5Button.trailingAnchor.constraint(equalTo: digit6Button.leadingAnchor, constant: -20),
            digit5Button.bottomAnchor.constraint(equalTo: digit6Button.bottomAnchor),
            digit5Button.heightAnchor.constraint(equalTo: equalButton.heightAnchor),
            digit5Button.widthAnchor.constraint(equalTo: equalButton.widthAnchor),
        ])
        
        let digit4Button = DigitButton.generate(title: "4")
        digit4Button.addTarget(self, action: #selector(digitButtonTapped), for: .touchUpInside)

        view.addSubview(digit4Button)

        NSLayoutConstraint.activate([
            digit4Button.trailingAnchor.constraint(equalTo: digit5Button.leadingAnchor, constant: -20),
            digit4Button.bottomAnchor.constraint(equalTo: digit5Button.bottomAnchor),
            digit4Button.heightAnchor.constraint(equalTo: equalButton.heightAnchor),
            digit4Button.widthAnchor.constraint(equalTo: equalButton.widthAnchor),
            digit4Button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
        
        let multiplyButton = BinaryOperatorButton(type: .custom)
        multiplyButton.tag = 100
        multiplyButton.addTarget(self, action: #selector(binaryOperandButtonTapped), for: .touchUpInside)
        multiplyButton.setTitle("×", for: .normal)
        multiplyButton.setTitleColor(multiplyButton.selectedColor, for: .normal)
        multiplyButton.setTitleColor(multiplyButton.defaultColor, for: .selected)
        multiplyButton.backgroundColor = multiplyButton.defaultColor
        multiplyButton.titleLabel?.font = UIFont.systemFont(ofSize: 46, weight: .semibold)
        
        multiplyButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(multiplyButton)
        
        NSLayoutConstraint.activate([
            multiplyButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            multiplyButton.bottomAnchor.constraint(equalTo: substructButton.topAnchor, constant: -20),
            multiplyButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.25, constant: -25),
            multiplyButton.heightAnchor.constraint(equalTo: multiplyButton.widthAnchor)
        ])
        
        let digit9Button = DigitButton.generate(title: "9")
        digit9Button.addTarget(self, action: #selector(digitButtonTapped), for: .touchUpInside)
        
        view.addSubview(digit9Button)
        
        NSLayoutConstraint.activate([
            digit9Button.trailingAnchor.constraint(equalTo: multiplyButton.leadingAnchor, constant: -20),
            digit9Button.bottomAnchor.constraint(equalTo: multiplyButton.bottomAnchor),
            digit9Button.heightAnchor.constraint(equalTo: equalButton.heightAnchor),
            digit9Button.widthAnchor.constraint(equalTo: equalButton.widthAnchor),
        ])
        
        let digit8Button = DigitButton.generate(title: "8")
        digit8Button.addTarget(self, action: #selector(digitButtonTapped), for: .touchUpInside)
        
        view.addSubview(digit8Button)
        
        NSLayoutConstraint.activate([
            digit8Button.trailingAnchor.constraint(equalTo: digit9Button.leadingAnchor, constant: -20),
            digit8Button.bottomAnchor.constraint(equalTo: digit9Button.bottomAnchor),
            digit8Button.heightAnchor.constraint(equalTo: equalButton.heightAnchor),
            digit8Button.widthAnchor.constraint(equalTo: equalButton.widthAnchor),
        ])
        
        let digit7Button = DigitButton.generate(title: "7")
        digit7Button.addTarget(self, action: #selector(digitButtonTapped), for: .touchUpInside)

        view.addSubview(digit7Button)

        NSLayoutConstraint.activate([
            digit7Button.trailingAnchor.constraint(equalTo: digit8Button.leadingAnchor, constant: -20),
            digit7Button.bottomAnchor.constraint(equalTo: digit8Button.bottomAnchor),
            digit7Button.heightAnchor.constraint(equalTo: equalButton.heightAnchor),
            digit7Button.widthAnchor.constraint(equalTo: equalButton.widthAnchor),
            digit7Button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
        
        let divideButton = BinaryOperatorButton(type: .custom)
        divideButton.tag = 101
        divideButton.addTarget(self, action: #selector(binaryOperandButtonTapped), for: .touchUpInside)
        divideButton.setTitle("÷", for: .normal)
        divideButton.setTitleColor(divideButton.selectedColor, for: .normal)
        divideButton.setTitleColor(divideButton.defaultColor, for: .selected)
        divideButton.backgroundColor = divideButton.defaultColor
        divideButton.titleLabel?.font = UIFont.systemFont(ofSize: 46, weight: .semibold)
        
        divideButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(divideButton)
        
        NSLayoutConstraint.activate([
            divideButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            divideButton.bottomAnchor.constraint(equalTo: multiplyButton.topAnchor, constant: -20),
            divideButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.25, constant: -25),
            divideButton.heightAnchor.constraint(equalTo: divideButton.widthAnchor)
        ])
        
        let percentButton = UnaryOperandButton(type: .custom)
        percentButton.tag = 201
        percentButton.addTarget(self, action: #selector(unaryOperatorButtonTapped), for: .touchUpInside)
        percentButton.setTitle("%", for: .normal)
        percentButton.setTitleColor(UnaryOperandButton.defaultTextColor, for: .normal)
        percentButton.backgroundColor = UnaryOperandButton.defaultBackgroundColor
        percentButton.titleLabel?.font = UIFont.systemFont(ofSize: 46, weight: .semibold)
        
        percentButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(percentButton)
        
        NSLayoutConstraint.activate([
            percentButton.trailingAnchor.constraint(equalTo: divideButton.leadingAnchor, constant: -20),
            percentButton.bottomAnchor.constraint(equalTo: divideButton.bottomAnchor),
            percentButton.heightAnchor.constraint(equalTo: equalButton.heightAnchor),
            percentButton.widthAnchor.constraint(equalTo: equalButton.widthAnchor),
        ])
        
        let invertButton = UnaryOperandButton(type: .custom)
        invertButton.tag = 202
        invertButton.addTarget(self, action: #selector(unaryOperatorButtonTapped), for: .touchUpInside)
        invertButton.setTitle("±", for: .normal)
        invertButton.setTitleColor(UnaryOperandButton.defaultTextColor, for: .normal)
        invertButton.backgroundColor = UnaryOperandButton.defaultBackgroundColor
        invertButton.titleLabel?.font = UIFont.systemFont(ofSize: 46, weight: .semibold)
        
        invertButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(invertButton)
        
        NSLayoutConstraint.activate([
            invertButton.trailingAnchor.constraint(equalTo: percentButton.leadingAnchor, constant: -20),
            invertButton.bottomAnchor.constraint(equalTo: percentButton.bottomAnchor),
            invertButton.heightAnchor.constraint(equalTo: equalButton.heightAnchor),
            invertButton.widthAnchor.constraint(equalTo: equalButton.widthAnchor),
        ])
        
        let clearButton = UnaryOperandButton(type: .custom)
        clearButton.addTarget(self, action: #selector(clearButtonTapped), for: .touchUpInside)
        clearButton.setTitle("AC", for: .normal)
        clearButton.setTitleColor(UnaryOperandButton.defaultTextColor, for: .normal)
        clearButton.backgroundColor = UnaryOperandButton.defaultBackgroundColor
        clearButton.titleLabel?.font = UIFont.systemFont(ofSize: 39, weight: .semibold)
        
        clearButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(clearButton)
        
        NSLayoutConstraint.activate([
            clearButton.trailingAnchor.constraint(equalTo: invertButton.leadingAnchor, constant: -20),
            clearButton.bottomAnchor.constraint(equalTo: invertButton.bottomAnchor),
            clearButton.heightAnchor.constraint(equalTo: equalButton.heightAnchor),
            clearButton.widthAnchor.constraint(equalTo: equalButton.widthAnchor),
            clearButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
        
        
        manualDisplayLabel.font = UIFont.systemFont(ofSize: 70)
        manualDisplayLabel.textAlignment = .right
        manualDisplayLabel.textColor = .white
        manualDisplayLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(manualDisplayLabel)
        
        NSLayoutConstraint.activate([
            manualDisplayLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            manualDisplayLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            manualDisplayLabel.bottomAnchor.constraint(equalTo: divideButton.topAnchor, constant: -20)
        ])
    }
}
