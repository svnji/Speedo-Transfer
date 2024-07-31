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
    
    private var viewModel = AuthViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //errorMessageLabel.isHidden = true
    }
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        guard let email = emailTextField.text, let password = passwordTextField.text else { return }
        
        viewModel.login(email: email, password: password) { [weak self] success in
            if success {
                self?.navigateToMain()
            } else {
                self?.errorMessageLabel.text = self?.viewModel.errorMessage
                self?.errorMessageLabel.isHidden = false
            }
        }
    }
    private func navigateToMain() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mainVC = storyboard.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
        self.present(mainVC, animated: true, completion: nil)
    }
}
