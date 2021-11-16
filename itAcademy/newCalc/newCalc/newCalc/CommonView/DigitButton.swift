//
//  DigitButton.swift
//  newCalc
//
//  Created by Сергей Матвеенко on 16.11.2021.
//

import UIKit

class DigitButton: RoundedButton {
    
    static let defaultTextColor = UIColor.white
      static let defaultBackgroundColor = UIColor.darkGray
      static let font = UIFont.systemFont(ofSize: 46, weight: .semibold)
      
      static func generate(title: String) -> DigitButton {
          let button = DigitButton(type: .custom)
          button.setTitle(title, for: .normal)
          button.tag = Int(title)!
          button.setTitleColor(DigitButton.defaultTextColor, for: .normal)
          button.backgroundColor = DigitButton.defaultBackgroundColor
          button.titleLabel?.font = DigitButton.font
          button.translatesAutoresizingMaskIntoConstraints = false
          
          return button
}
