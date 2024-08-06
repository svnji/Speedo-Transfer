//
//  profileInformationViewController.swift
//  MoneyTransferApp
//
//  Created by Daddy on 04/08/2024.
//

import UIKit

class ProfileInformationViewController: UIViewController {
    @IBOutlet weak var profileInformationView: UIView!
    @IBOutlet weak var fullNameLabel: UIView!
    @IBOutlet weak var emailLabeld: UILabel!
    @IBOutlet weak var dateOfBirthLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var bankAccountLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupGradientBackground()
        setupNavigationBar()
    }
    

    private func setupGradientBackground() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = profileInformationView.bounds
        if let TransferViewColor = UIColor(named: "MainViewColor") {
            gradientLayer.colors = [TransferViewColor.cgColor, UIColor.red.cgColor]
        } else {
            gradientLayer.colors = [UIColor.systemPink.cgColor, UIColor.red.cgColor]
        }
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 10.0)
        profileInformationView.layer.insertSublayer(gradientLayer, at: 0)
    }
    private func setupNavigationBar() {
          // Set the title for the navigation bar
          self.title = "Personal Information"
        self.navigationController?.navigationBar.tintColor = UIColor.gray
      }

}
