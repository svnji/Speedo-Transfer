//
//  transactionDetailsViewController.swift
//  MoneyTransferApp
//
//  Created by Daddy on 05/08/2024.
//

import UIKit

class transactionDetailsViewController: UIViewController {
    @IBOutlet weak var transactionDetailsView: UIView!
    @IBOutlet weak var transferAmountLabel: UILabel!
    @IBOutlet weak var senderNameLabel: UILabel!
    @IBOutlet weak var senderAccountLabel: UILabel!
    @IBOutlet weak var recepiantNameLabel: UILabel!
    @IBOutlet weak var recepiantAccountLabel: UILabel!
    @IBOutlet weak var transferAmountAmountLabel: UILabel!
    @IBOutlet weak var referenceLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupGradientBackground()
    }
    private func setupGradientBackground() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = transactionDetailsView.bounds
        if let TransferViewColor = UIColor(named: "MainViewColor") {
            gradientLayer.colors = [TransferViewColor.cgColor, UIColor.red.cgColor]
        } else {
            gradientLayer.colors = [UIColor.systemPink.cgColor, UIColor.red.cgColor]
        }
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 10.0)
        transactionDetailsView.layer.insertSublayer(gradientLayer, at: 0)
    }
    @IBOutlet weak var sendMoneyBtnTapped: UIButton!
    
}
