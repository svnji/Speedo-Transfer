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
    
    private var viewModel = AuthViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        errorMessageLabel.isHidden = true
    }
    
    @IBAction func registerButtonTapped(_ sender: UIButton) {
        guard let name = nameTextField.text, let email = emailTextField.text, let password = passwordTextField.text else { return }
        
        viewModel.register(name: name, email: email, password: password) { [weak self] success in
            if success {
                self?.navigateToLogin()
            } else {
                self?.errorMessageLabel.text = self?.viewModel.errorMessage
                self?.errorMessageLabel.isHidden = false
            }
        }
    }
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let loginVC = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        self.present(loginVC, animated: true, completion: nil)
    }
    
    private func navigateToLogin() {
        self.dismiss(animated: true, completion: nil)
    }
}

