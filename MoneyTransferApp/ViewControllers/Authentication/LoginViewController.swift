import Foundation
import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorMessageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupGradientBackground()
        setupNavigationBar()
        self.navigationItem.hidesBackButton = true
    }
    
    @IBAction func navigateToSignUp(_ sender: Any) {
        goToSignUpScreen()
    }
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        guard let email = emailTextField.text, !email.isEmpty,
              let password = passwordTextField.text, !password.isEmpty else {
            showAlert(title: "Error", message: "Please enter both email and password.")
            return
        }
        
        AuthService2.loginUser(with: email, password: password) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let response):
                    print("Success: \(response)")
                    
                    // Handle successful login
                    if let token = response["token"] as? String {
                        print("Token: \(token)")
                        Session.shared.authToken = token
                        
                        // Show alert before navigating
                        self.showAlertWithCompletion(title: "Success", message: "Successfully logged in") {
                            self.navigateToMain()
                        }
                    } else {
                        self.showAlert(title: "Error", message: "Failed to get token.")
                    }
                    
                case .failure(let error):
                    print("Error: \(error.localizedDescription)")
                    self.showAlert(title: "Login Error", message: error.localizedDescription)
                }
            }
        }
    }

    private func showAlertWithCompletion(title: String, message: String, completion: @escaping () -> Void) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            completion()
        }
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    private func setupGradientBackground() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor.white.cgColor, UIColor.red.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 6.0)
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    private func setupNavigationBar() {
        self.title = "Sign in"
    }
    
    private func goToSignUpScreen() {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let registerViewController = sb.instantiateViewController(withIdentifier: "RegisterViewController") as! RegisterViewController
        self.navigationController?.pushViewController(registerViewController, animated: true)
    }
    
    private func navigateToMain() {
        // Assuming CustomTabBarController is defined in your storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let tabBarController = storyboard.instantiateViewController(withIdentifier: "CustomTabBarController") as? CustomTabBarController {
            // Set the CustomTabBarController as the root view controller
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
               let sceneDelegate = windowScene.delegate as? SceneDelegate,
               let window = sceneDelegate.window {
                window.rootViewController = tabBarController
                window.makeKeyAndVisible()
            } else {
                self.present(tabBarController, animated: true, completion: nil)
            }
        }
    }
    
   
}
