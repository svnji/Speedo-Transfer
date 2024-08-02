//
//  MainViewController.swift
//  MoneyTransferApp
//
//  Created by Daddy on 31/07/2024.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {

 
    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var currentBalance: UILabel!
    
    @IBOutlet weak var recentTransactionDateAndStatus1: UILabel!
    @IBOutlet weak var recentTransactionMasterCard1: UILabel!
    @IBOutlet weak var recentTransactionValue1: UILabel!
    @IBOutlet weak var recentTransactionName1: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupGradientBackground()
    }
    
    
    private func setupGradientBackground() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = mainView.bounds
        if let MainViewColor = UIColor(named: "MainViewColor") {
            gradientLayer.colors = [MainViewColor.cgColor, UIColor.red.cgColor]
        } else {
            gradientLayer.colors = [UIColor.systemPink.cgColor, UIColor.red.cgColor]
        }
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 10.0)
        mainView.layer.insertSublayer(gradientLayer, at: 0)
    }
}

