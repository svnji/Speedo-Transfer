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
        self.navigationItem.hidesBackButton = true
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)

        // errorMessageLabel.isHidden = true
    }
    
    @IBAction func navigateToSignIn(_ sender: Any) {
        self.goToLoginScreen()
    }
    @IBAction func registerButtonTapped(_ sender: UIButton) {
//        isValidData()
        if true {
            print("valid")
            self.goToCompleteRegisterScreen()
          
                 }
        
    }
    private func goToCompleteRegisterScreen (){
        let sb = UIStoryboard(name: StoryBoards.main, bundle: nil)
        let completeRegister = sb.instantiateViewController(withIdentifier: VCs.completeRegister) as! CompleteRegister
        self.navigationController?.pushViewController(completeRegister, animated: true)
   
    }
    private func goToLoginScreen (){
        let sb = UIStoryboard(name: StoryBoards.main, bundle: nil)
        let loginVC = sb.instantiateViewController(withIdentifier: VCs.login) as! LoginViewController
        self.navigationController?.pushViewController(loginVC, animated: true)
   
    }
    private func isValidData () -> Bool {
       
        guard nameTextField.text?.trimmed != "" else {
            self.showAlert(title: "Sorry", message: "Please enter your name!")
            return false
        }	
        //email
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.com"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)

        guard emailTextField.text?.trimmed != "" else {
            self.showAlert(title: "Sorry", message: "Please enter your email!")
            return false
        }
        guard emailPredicate.evaluate(with: emailTextField.text) else {
              self.showAlert(title: "Sorry", message: "Please enter a valid email address!")
              return false
          }
        //password
        guard passwordTextField.text?.trimmed != "" else {
            self.showAlert(title: "Sorry", message: "Please enter your password!")
            return false
        }
        let passwordRegex =  "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d).{8,}$"
        let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        guard passwordPredicate.evaluate(with: passwordTextField.text) else {
            self.showAlert(title: "Sorry", message: "Password must be at least 8 characters long, with at least one uppercase letter, one lowercase letter, and one number.")
            return false
        }
     return true
    }


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
      }
}
