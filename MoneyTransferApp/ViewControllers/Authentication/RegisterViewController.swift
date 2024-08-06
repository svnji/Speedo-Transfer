import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorMessageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupGradientBackground()
        setupNavigationBar()
        self.navigationItem.hidesBackButton = true
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    @IBAction func navigateToSignIn(_ sender: Any) {
        goToLoginScreen()
    }
    
    @IBAction func registerButtonTapped(_ sender: UIButton) {
        if isValidData() {
            let fullName = nameTextField.text?.split(separator: " ").map(String.init) ?? []
            let firstName = fullName.first ?? ""
            let lastName = fullName.count > 1 ? fullName[1] : ""
            let email = emailTextField.text?.trimmed ?? ""
            let password = passwordTextField.text?.trimmed ?? ""
            
            let tempUser = TempUser(firstName: firstName, lastName: lastName, email: email, password: password)
            goToCompleteRegisterScreen(with: tempUser)
        }
    }
    
    private func goToCompleteRegisterScreen(with tempUser: TempUser) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let completeRegister = sb.instantiateViewController(withIdentifier: "CompleteRegister") as! CompleteRegister
        completeRegister.tempUser = tempUser
        self.navigationController?.pushViewController(completeRegister, animated: true)
    }
    
    private func goToLoginScreen() {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let loginVC = sb.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        self.navigationController?.pushViewController(loginVC, animated: true)
    }
    
    private func isValidData() -> Bool {
        guard let name = nameTextField.text?.trimmed, !name.isEmpty else {
            showAlert(title: "Sorry", message: "Please enter your name!")
            return false
        }
        
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.com"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        guard let email = emailTextField.text?.trimmed, !email.isEmpty, emailPredicate.evaluate(with: email) else {
            showAlert(title: "Sorry", message: "Please enter a valid email address!")
            return false
        }
        
        let passwordRegex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d).{8,}$"
        let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        guard let password = passwordTextField.text?.trimmed, !password.isEmpty, passwordPredicate.evaluate(with: password) else {
            showAlert(title: "Sorry", message: "Password must be at least 8 characters long, with at least one uppercase letter, one lowercase letter, and one number.")
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
        self.title = "Sign Up"
    }
}
