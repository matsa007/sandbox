//
//  RoundedButton.swift
//  Calculator
//
//  Created by Nickolai Nikishin on 6.11.21.
//

import UIKit

class RoundedButton: UIButton {
    func roundCorners() {
        layer.cornerRadius = frame.height / 2
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        roundCorners()
    }
}
