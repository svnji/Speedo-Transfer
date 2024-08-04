//
//  profileViewController.swift
//  MoneyTransferApp
//
//  Created by Daddy on 04/08/2024.
//

import UIKit

class profileViewController: UIViewController {
    @IBOutlet var profileView: UIView!
    @IBOutlet weak var profileNameLabel: UILabel!
    @IBOutlet weak var profileImage: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupGradientBackground()
    }
    

    private func setupGradientBackground() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = profileView.bounds
        if let TransferViewColor = UIColor(named: "MainViewColor") {
            gradientLayer.colors = [TransferViewColor.cgColor, UIColor.red.cgColor]
        } else {
            gradientLayer.colors = [UIColor.systemPink.cgColor, UIColor.red.cgColor]
        }
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 10.0)
        profileView.layer.insertSublayer(gradientLayer, at: 0)
    }
    @IBAction func profileInformationBtnTapped(_ sender: Any) {
    }
    @IBAction func settingBtnTapped(_ sender: Any) {
    }
    @IBAction func paymentHistoryBtnTapped(_ sender: Any) {
    }
    @IBAction func myFavouriteListBtnTapped(_ sender: Any) {
    }
    
}
