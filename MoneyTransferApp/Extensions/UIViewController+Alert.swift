//
//  UIViewController+Alert.swift
//  MoneyTransferApp
//
//  Created by 1234 on 01/08/2024.
//

import Foundation
import UIKit
extension UIViewController {
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
          alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
       self.present(alert, animated: true, completion: nil)
    }
    
}

