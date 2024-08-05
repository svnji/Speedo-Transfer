//
//  editProfileViewController.swift
//  MoneyTransferApp
//
//  Created by Daddy on 04/08/2024.
//

import UIKit

class EditProfileViewController : UIViewController {
    @IBOutlet weak var editProfileView: UIView!
    @IBOutlet weak var fullNameTextField: UIView!
    @IBOutlet weak var emailTextField: UIView!
    @IBOutlet weak var countryOptionField: UIView!
    @IBOutlet weak var dateOfBirthField: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupGradientBackground()
    }
    

    private func setupGradientBackground() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = editProfileView.bounds
        if let TransferViewColor = UIColor(named: "MainViewColor") {
            gradientLayer.colors = [TransferViewColor.cgColor, UIColor.red.cgColor]
        } else {
            gradientLayer.colors = [UIColor.systemPink.cgColor, UIColor.red.cgColor]
        }
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 10.0)
        editProfileView.layer.insertSublayer(gradientLayer, at: 0)
    }
    @IBOutlet weak var saveBtnTapped: UIView!
    

}
