import UIKit
import FittedSheets

class CompleteRegister: UIViewController, OptionsViewControllerDelegate {

    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var dateOfBirthTextField: UITextField!
    
    private let datePicker = UIDatePicker()
    var tempUser: TempUser?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupGradientBackground()
        setupDatePicker()
        setupNavigationBar()
        
        let countryTapGesture = UITapGestureRecognizer(target: self, action: #selector(showCountryOptions))
        countryTextField.addGestureRecognizer(countryTapGesture)
        countryTextField.isUserInteractionEnabled = true
        
        // Print tempUser to verify it's being passed correctly
        if let tempUser = tempUser {
            print("TempUser: \(tempUser)")
        } else {
            print("TempUser is nil")
        }
    }
    
    private func setupGradientBackground() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor.white.cgColor, UIColor.red.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 5.0)
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    private func setupDatePicker() {
        datePicker.datePickerMode = .date
        if #available(iOS 13.4, *) {
            datePicker.preferredDatePickerStyle = .wheels
        }
        datePicker.maximumDate = Date()
        datePicker.addTarget(self, action: #selector(dateChanged), for: .valueChanged)
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneTapped))
        toolbar.setItems([doneButton], animated: true)
        
        dateOfBirthTextField.inputAccessoryView = toolbar
        dateOfBirthTextField.inputView = datePicker
    }
    
    @objc private func dateChanged() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateOfBirthTextField.text = dateFormatter.string(from: datePicker.date)
    }
    
    @objc private func doneTapped() {
        dateOfBirthTextField.resignFirstResponder()
    }
    
    @objc private func showCountryOptions() {
        let optionsVC = OptionsViewController()
        optionsVC.delegate = self
        let sheetController = SheetViewController(controller: optionsVC, sizes: [.fixed(300), .fullscreen])
        self.present(sheetController, animated: true, completion: nil)
    }
    
    func didSelectOption(_ option: Option) {
        countryTextField.text = option.title
    }
    
    private func setupNavigationBar() {
        self.title = "Complete Registration"
        self.navigationController?.navigationBar.tintColor = UIColor.gray
    }
    private func goToLoginScreen() {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let loginVC = sb.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        self.navigationController?.pushViewController(loginVC, animated: true)
    }
    @IBAction func submitRegisterBtnTapped(_ sender: Any) {
        guard let tempUser = tempUser else {
            // Handle missing user data
            return
        }
        
        let firstName = tempUser.firstName
        let lastName = tempUser.lastName
        let email = tempUser.email
        let password = tempUser.password
        let userName = "\(firstName)\(lastName)"
        let country = countryTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? "Egypt"
        let dateOfBirth = "1990-09-09"

        let user = UserRegistrationRequest(
            firstName: firstName,
            lastName: lastName,
            email: email,
            password: password,
            userName: userName,
            country: country,
            dateOfBirth: dateOfBirth
        )
        
        // Print the user object to verify its content
        print("User object to be sent: \(user)")
        
        AuthService.registerUser(with: user) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let response):
                    // Print the response from the API for debugging
                    print("API Response: \(response)")
                    
                    // Navigate to the login screen
                    self.goToLoginScreen()

                case .failure(let error):
                    // Print the error message for debugging
                    print("API Error: \(error.localizedDescription)")
                    
                    // Navigate to the login screen
                    self.goToLoginScreen()
                }
            }
        }
    }

}
