//
//  changePasswordViewController.swift
//  MoneyTransferApp
//
//  Created by Daddy on 04/08/2024.
//

import UIKit

class changePasswordViewController: UIViewController {
    @IBOutlet weak var changePasswordView: UIView!
    @IBOutlet weak var currentPasswordTextField: UITextField!
    @IBOutlet weak var newPasswordTextFeild: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupGradientBackground()
    }
    

    private func setupGradientBackground() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = changePasswordView.bounds
        if let TransferViewColor = UIColor(named: "MainViewColor") {
            gradientLayer.colors = [TransferViewColor.cgColor, UIColor.red.cgColor]
        } else {
            gradientLayer.colors = [UIColor.systemPink.cgColor, UIColor.red.cgColor]
        }
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 10.0)
        changePasswordView.layer.insertSublayer(gradientLayer, at: 0)
    }
    @IBAction func saveBtnTapped(_ sender: Any) {
    }
    
}
