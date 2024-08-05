//
//  secoundTransactionConfirmationViewController.swift
//  MoneyTransferApp
//
//  Created by Daddy on 02/08/2024.
//

import Foundation
import UIKit


class SecoundTransactionConfirmationViewController: UIViewController {

 
    @IBOutlet weak var secondTransferConfirmationView: UIView!
    @IBOutlet weak var transferAmountLabel: UILabel!
    @IBOutlet weak var recipientAccountLabel: UIView!
    @IBOutlet weak var recipientNameLabel: UIView!
    @IBOutlet weak var senderAccountLabel: UILabel!
    @IBOutlet weak var senderNameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupGradientBackground()
    }
    
    
    private func setupGradientBackground() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = secondTransferConfirmationView.bounds
        if let MainViewColor = UIColor(named: "MainViewColor") {
            gradientLayer.colors = [MainViewColor.cgColor, UIColor.red.cgColor]
        } else {
            gradientLayer.colors = [UIColor.systemPink.cgColor, UIColor.red.cgColor]
        }
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 10.0)
        secondTransferConfirmationView.layer.insertSublayer(gradientLayer, at: 0)
    }
    @IBAction func backToHomeBtnTapped(_ sender: Any) {
        if let tabBarController = self.tabBarController {
               // Reset the Transfer tab to its initial state
               if let transferNavController = tabBarController.viewControllers?[1] as? UINavigationController {
                   transferNavController.popToRootViewController(animated: false)
               }
               // Switch to the Home tab
               tabBarController.selectedIndex = 0
           }
    }
    @IBAction func addToFavouriteBtnTapped(_ sender: Any) {
    }
    
}
