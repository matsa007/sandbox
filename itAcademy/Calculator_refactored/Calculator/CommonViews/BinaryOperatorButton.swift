//
//  BinaryOperatorButton.swift
//  Calculator
//
//  Created by Nickolai Nikishin on 6.11.21.
//

import UIKit

class BinaryOperatorButton: RoundedButton {
    let defaultColor = UIColor.systemOrange
    let selectedColor = UIColor.white
    

    override var isSelected: Bool {
        didSet {
            backgroundColor = isSelected ? selectedColor : defaultColor
        }
    }
}
