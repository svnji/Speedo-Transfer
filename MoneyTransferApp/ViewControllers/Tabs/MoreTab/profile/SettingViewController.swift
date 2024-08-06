//
//  SettingViewController.swift
//  MoneyTransferApp
//
//  Created by Daddy on 04/08/2024.
//

import UIKit

class SettingViewController: UIViewController {
    @IBOutlet weak var settingView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupGradientBackground()
        setupNavigationBar()
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    

    private func setupGradientBackground() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = settingView.bounds
        if let TransferViewColor = UIColor(named: "MainViewColor") {
            gradientLayer.colors = [TransferViewColor.cgColor, UIColor.red.cgColor]
        } else {
            gradientLayer.colors = [UIColor.systemPink.cgColor, UIColor.red.cgColor]
        }
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 10.0)
        settingView.layer.insertSublayer(gradientLayer, at: 0)
    }
    @IBAction func changePasswordBtnTapped(_ sender: Any) {
        
        let sb = UIStoryboard(name: StoryBoards.main, bundle: nil)
        let changePasswordViewController = sb.instantiateViewController(withIdentifier: VCs.changePasswordViewController) as! ChangePasswordViewController
        self.navigationController?.pushViewController(changePasswordViewController, animated: true)
    }
    @IBAction func editProfileBtnTapped(_ sender: Any) {
        
        let sb = UIStoryboard(name: StoryBoards.main, bundle: nil)
        let editProfileViewController = sb.instantiateViewController(withIdentifier: VCs.editProfileViewController) as! EditProfileViewController
        self.navigationController?.pushViewController(editProfileViewController, animated: true)
    }
    private func setupNavigationBar() {
          // Set the title for the navigation bar
          self.title = "Setting"
        self.navigationController?.navigationBar.tintColor = UIColor.gray
      }
}
