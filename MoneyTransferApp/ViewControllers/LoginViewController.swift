//
//  LoginViewController.swift
//  MoneyTransferApp
//
//  Created by Daddy on 31/07/2024.
//

import Foundation
import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorMessageLabel: UILabel!
    
//    private var viewModel = AuthViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupGradientBackground()
        //errorMessageLabel.isHidden = true
    }
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mainVC = storyboard.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
        self.present(mainVC, animated: true, completion: nil)
    }
    
//    private func navigateToMain() {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let mainVC = storyboard.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
//        self.present(mainVC, animated: true, completion: nil)
//    }
    
    private func setupGradientBackground() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor.white.cgColor, UIColor.red.cgColor] 
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 8.0)
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
}
