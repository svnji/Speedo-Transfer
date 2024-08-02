import UIKit
import FittedSheets

class CompleteRegister: UIViewController, OptionsViewControllerDelegate {
    
    @IBOutlet weak var countryTextField: UITextField!
//    @IBOutlet weak var dateOfBirthTextField: UITextField!
    @IBOutlet weak var dateOfBirthTextField: UITextField!
    
    private let datePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupGradientBackground()
        setupDatePicker()
        setupNavigationBar()
      

        
        let countryTapGesture = UITapGestureRecognizer(target: self, action: #selector(showCountryOptions))
        countryTextField.addGestureRecognizer(countryTapGesture)
        countryTextField.isUserInteractionEnabled = true
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
    //navigation
    private func setupNavigationBar() {
          // Set the title for the navigation bar
          self.title = "Sign Up"
        self.navigationController?.navigationBar.tintColor = UIColor.gray
      }
    
    //buttons
    @IBAction func submitRegisterBtnTapped(_ sender: Any) {
        print("done")
        // validate data
        //go to home
    }
    
}
