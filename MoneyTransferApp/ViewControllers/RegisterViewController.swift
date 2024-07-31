//
//  RegisterViewController.swift
//  MoneyTransferApp
//
//  Created by Daddy on 31/07/2024.
//

import Foundation
import UIKit


class RegisterViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorMessageLabel: UILabel!
    
//    private var viewModel = AuthViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupGradientBackground()
        setupNavigationBar()
        // errorMessageLabel.isHidden = true
    }
    
    @IBAction func registerButtonTapped(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let secondRegisterVC = storyboard.instantiateViewController(withIdentifier: "SecondRegister") as! SecondRegister
        self.present(secondRegisterVC, animated: true, completion: nil)
    }
    
//    private func navigateToSecondRegister() {
//        self.present(SecondRegister(), animated: true)
//    }
    
    private func setupGradientBackground() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor.white.cgColor, UIColor.red.cgColor] 
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 8.0)
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    private func setupNavigationBar() {
          // Set the title for the navigation bar
          self.title = "Sign Up"

          
          // Alternatively, you can use navigationItem
          // self.navigationItem.title = "Register"
      }
}
