//
//  Alerts.swift
//  MapRoutes
//
//  Created by Сергей Матвеенко on 08.12.2021.
//

import UIKit

extension UIViewController {

    func addAddressAlert(title: String, placeHolder: String, completionHandler: @escaping (String) -> Void) {
        let alertController = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        let alertOk = UIAlertAction(title: "Ok", style: .default) { (action) in
            let textfieldText = alertController.textFields?.first
            guard let text = textfieldText?.text else {
                return
            }
            completionHandler(text)
        }
        
        let alertCancel = UIAlertAction(title: "Cancel", style: .default) { (_) in
            
        }
        
        let alertPochyi = UIAlertAction(title: "Похуй, найди магазин с пивком", style: .default) { (_) in
            
        }
        
        
        alertController.addTextField { textField in
            textField.placeholder = placeHolder
        }
        
        alertController.addAction(alertOk)
        alertController.addAction(alertCancel)
        alertController.addAction(alertPochyi)
        present(alertController, animated: true, completion: nil)
    }
    
    
    
    
    
}
