//
//  transferViewController.swift
//  MoneyTransferApp
//
//  Created by Daddy on 01/08/2024.
//

import Foundation
import UIKit
import FittedSheets

class transferViewController: UIViewController, FavoritesViewControllerDelegate {
    
    @IBOutlet weak var recipientTextField: UITextField!
    @IBOutlet weak var sendTextField: UITextField!
    @IBOutlet weak var transferView: UIView!
    @IBOutlet weak var recipientNameTextField: UITextField!
    @IBOutlet weak var recipientAccountTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupGradientBackground()
        setupNavigationBar()
        
    }
    
    private func setupGradientBackground() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = transferView.bounds
        if let TransferViewColor = UIColor(named: "MainViewColor") {
            gradientLayer.colors = [TransferViewColor.cgColor, UIColor.red.cgColor]
        } else {
            gradientLayer.colors = [UIColor.systemPink.cgColor, UIColor.red.cgColor]
        }
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 10.0)
        transferView.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    @IBAction func favouriteBtnTapped(_ sender: Any) {
        let favoritesVC = FavoritesViewController()
        favoritesVC.delegate = self
        let sheetController = SheetViewController(controller: favoritesVC, sizes: [.fixed(300), .fullscreen])
        self.present(sheetController, animated: true, completion: nil)
    }
    
    @IBAction func continueBtnTapped(_ sender: Any) {
        // Handle continue action
    }
    
    func didSelectFavorite(_ favorite: Favorite) {
        recipientNameTextField.text = favorite.name
        recipientAccountTextField.text = favorite.account
    }
    private func setupNavigationBar() {
          // Set the title for the navigation bar
          self.title = "Transfer"
      }
}