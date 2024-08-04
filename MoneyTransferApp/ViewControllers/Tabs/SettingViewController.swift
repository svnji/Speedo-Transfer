//
//  SettingViewController.swift
//  MoneyTransferApp
//
//  Created by Daddy on 04/08/2024.
//

import UIKit

class SettingViewController: UIViewController {
    @IBOutlet weak var settingView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupGradientBackground()
    }
    

    private func setupGradientBackground() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = settingView.bounds
        if let TransferViewColor = UIColor(named: "MainViewColor") {
            gradientLayer.colors = [TransferViewColor.cgColor, UIColor.red.cgColor]
        } else {
            gradientLayer.colors = [UIColor.systemPink.cgColor, UIColor.red.cgColor]
        }
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 10.0)
        settingView.layer.insertSublayer(gradientLayer, at: 0)
    }
    @IBAction func changePasswordBtnTapped(_ sender: Any) {
    }
    @IBAction func editProfileBtnTapped(_ sender: Any) {
    }
}
