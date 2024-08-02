//
//  firstTransferConfirmationViewController.swift
//  MoneyTransferApp
//
//  Created by Daddy on 02/08/2024.
//

import Foundation
import UIKit


class firstTransferViewController: UIViewController {

 
    @IBOutlet weak var firstTransferConfirmationView: UIView!
    @IBOutlet weak var transferAmountLabel: UILabel!
    @IBOutlet weak var totalAmountLabel: UILabel!
    @IBOutlet weak var recipientAccountLabel: UILabel!
     @IBOutlet weak var recipientNameLabel: UILabel!
    @IBOutlet weak var senderAccountLabel: UILabel!
    @IBOutlet weak var senderNameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupGradientBackground()
    }
    
    
    private func setupGradientBackground() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = firstTransferConfirmationView.bounds
        if let MainViewColor = UIColor(named: "MainViewColor") {
            gradientLayer.colors = [MainViewColor.cgColor, UIColor.red.cgColor]
        } else {
            gradientLayer.colors = [UIColor.systemPink.cgColor, UIColor.red.cgColor]
        }
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 10.0)
        firstTransferConfirmationView.layer.insertSublayer(gradientLayer, at: 0)
    }
    @IBAction func confirmTransferBtnTapped(_ sender: Any) {
    }
    @IBAction func previousBtnTapped(_ sender: Any) {
    }
}
