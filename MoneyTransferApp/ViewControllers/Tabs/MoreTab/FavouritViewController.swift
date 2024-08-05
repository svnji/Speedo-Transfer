//
//  favouriteListViewController.swift
//  MoneyTransferApp
//
//  Created by Daddy on 04/08/2024.
//

import Foundation
import UIKit

class FavouritViewController: UIViewController {

    @IBOutlet weak var favouriteListView: UIView!
    override func viewDidLoad() {
           super.viewDidLoad()
        setupGradientBackground()
        self.title = "Favourite"
        self.navigationController?.navigationBar.tintColor = UIColor.gray

       }
    private func setupGradientBackground() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = favouriteListView.bounds
        if let MainViewColor = UIColor(named: "MainViewColor") {
            gradientLayer.colors = [MainViewColor.cgColor, UIColor.red.cgColor]
        } else {
            gradientLayer.colors = [UIColor.systemPink.cgColor, UIColor.red.cgColor]
        }
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 10.0)
        favouriteListView.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    @IBAction func editFavouriteBtnTapped1(_ sender: Any) {
    }
    @IBAction func deleteFavouriteBtnTapped1(_ sender: Any) {
    }
    
    @IBAction func editFavouriteBtnTapped2(_ sender: Any) {
    }
    @IBAction func deleteFavouriteBtnTapped2(_ sender: Any) {
    }
    
    
}
