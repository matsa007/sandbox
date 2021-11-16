//
//  BinaryOperatorButton.swift
//  newCalc
//
//  Created by Сергей Матвеенко on 06.11.2021.
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
