//
//  FavoritesViewController.swift
//  MoneyTransferApp
//
//  Created by Daddy on 01/08/2024.
//

import Foundation
import UIKit
import FittedSheets
struct Favorite {
    let name: String
    let account: String
    let imageName: String
}

protocol FavoritesViewControllerDelegate: AnyObject {
    func didSelectFavorite(_ favorite: Favorite)
}

class FavoritesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let favorites: [Favorite] = [
        Favorite(name: "Asmaa Dosuky", account: "Account xxxx7890", imageName: "bank_icon"), // Adjust the image names as needed
        Favorite(name: "John Doe", account: "Account xxxx1234", imageName: "bank_icon")
    ]
    
    weak var delegate: FavoritesViewControllerDelegate?
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(FavoriteTableViewCell.self, forCellReuseIdentifier: "FavoriteTableViewCell")
        tableView.tableFooterView = UIView()
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favorites.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteTableViewCell", for: indexPath) as? FavoriteTableViewCell else {
            return UITableViewCell()
        }
        let favorite = favorites[indexPath.row]
        cell.configure(with: favorite)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedFavorite = favorites[indexPath.row]
        delegate?.didSelectFavorite(selectedFavorite)
        dismiss(animated: true, completion: nil)
    }
}
