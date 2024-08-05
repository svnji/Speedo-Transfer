//
//  TransactionsViewController.swift
//  MoneyTransferApp
//
//  Created by 1234 on 03/08/2024.
//

import UIKit

class TransactionsViewController: UIViewController {
    @IBOutlet weak var transactionView: UIView!
    @IBOutlet weak var transactionName: UIView!
    @IBOutlet weak var transactionBankAccount: UIView!
    @IBOutlet weak var transactionTime: UIView!
    @IBOutlet weak var transactionState: UIView!
    
    override func viewDidLoad() {
           super.viewDidLoad()
        setupGradientBackground()
    }
    

    private func setupGradientBackground() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = transactionView.bounds
        if let TransferViewColor = UIColor(named: "MainViewColor") {
            gradientLayer.colors = [TransferViewColor.cgColor, UIColor.red.cgColor]
        } else {
            gradientLayer.colors = [UIColor.systemPink.cgColor, UIColor.red.cgColor]
        }
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 10.0)
        transactionView.layer.insertSublayer(gradientLayer, at: 0)
    }
}
