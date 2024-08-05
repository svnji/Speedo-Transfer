//
//  successfulTransactoinViewController.swift
//  MoneyTransferApp
//
//  Created by Daddy on 05/08/2024.
//

import UIKit

class successfulTransactoinViewController: UIViewController {
    @IBOutlet weak var successfulTransactionView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupGradientBackground()
    }
    

    private func setupGradientBackground() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = successfulTransactionView.bounds
        if let TransferViewColor = UIColor(named: "MainViewColor") {
            gradientLayer.colors = [TransferViewColor.cgColor, UIColor.red.cgColor]
        } else {
            gradientLayer.colors = [UIColor.systemPink.cgColor, UIColor.red.cgColor]
        }
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 10.0)
        successfulTransactionView.layer.insertSublayer(gradientLayer, at: 0)
    }

}

