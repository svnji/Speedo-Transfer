//
//  profileViewController.swift
//  MoneyTransferApp
//
//  Created by Daddy on 04/08/2024.
//

import UIKit

class ProfileViewController: UIViewController {
    @IBOutlet var profileView: UIView!
    @IBOutlet weak var profileNameLabel: UILabel!
    @IBOutlet weak var profileImage: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupGradientBackground()
        setupNavigationBar()
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
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
        let sb = UIStoryboard(name: StoryBoards.main, bundle: nil)
        let profileInformationViewController = sb.instantiateViewController(withIdentifier: VCs.profileInformationViewController) as! ProfileInformationViewController
        self.navigationController?.pushViewController(profileInformationViewController, animated: true)
    }
    @IBAction func settingBtnTapped(_ sender: Any) {
        let sb = UIStoryboard(name: StoryBoards.main, bundle: nil)
        let settingViewController = sb.instantiateViewController(withIdentifier: VCs.settingViewController) as! SettingViewController
        self.navigationController?.pushViewController(settingViewController, animated: true)
        
    }
    @IBAction func paymentHistoryBtnTapped(_ sender: Any) {
    }
    @IBAction func myFavouriteListBtnTapped(_ sender: Any) {
    }
    private func setupNavigationBar() {
          // Set the title for the navigation bar
          self.title = "Profile"
        self.navigationController?.navigationBar.tintColor = UIColor.gray
      }
    
}
