//
//  SecondRegister.swift
//  MoneyTransferApp
//
//  Created by Daddy on 31/07/2024.
//

import Foundation
import UIKit

class SecondRegister: UIViewController {
    
    @IBOutlet weak var countryTextField: UITextField!
    
    @IBOutlet weak var dateOfBirthTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupGradientBackground()
    }
    private func setupGradientBackground() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor.white.cgColor, UIColor.red.cgColor] 
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 8.0)
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
}
