//
//  UnaryOperandButton.swift
//  Calculator
//
//  Created by Александр Савков on 14.11.21.
//

import UIKit

class UnaryOperandButton: RoundedButton {

    static let defaultTextColor = UIColor.black
    static let defaultBackgroundColor = UIColor.lightGray
    static let font = UIFont.systemFont(ofSize: 46, weight: .semibold)
    
    static func generate(title: String) -> UnaryOperandButton {
        let button = UnaryOperandButton(type: .custom)
        button.setTitle(title, for: .normal)
        button.setTitleColor(UnaryOperandButton.defaultTextColor, for: .normal)
        button.backgroundColor = UnaryOperandButton.defaultBackgroundColor
        button.titleLabel?.font = DigitButton.font
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }
}
