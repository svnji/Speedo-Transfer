//
//  OptionsViewController.swift
//  MoneyTransferApp
//
//  Created by Daddy on 31/07/2024.
//

import UIKit
import FittedSheets


struct Option: Equatable {
    let title: String
    let imageName: String

    static func == (lhs: Option, rhs: Option) -> Bool {
        return lhs.title == rhs.title && lhs.imageName == rhs.imageName
    }
}

protocol OptionsViewControllerDelegate: AnyObject {
    func didSelectOption(_ option: Option)
}

class OptionsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let options: [Option] = [
        Option(title: "Egypt", imageName: "egypt"),
        Option(title: "USA", imageName: "united states")]
    
    var selectedOption: Option?
    weak var delegate: OptionsViewControllerDelegate?
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(OptionTableViewCell.self, forCellReuseIdentifier: "OptionTableViewCell")
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
        return options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "OptionTableViewCell", for: indexPath) as? OptionTableViewCell else {
            return UITableViewCell()
        }
        let option = options[indexPath.row]
        cell.configure(with: option, isSelected: option == selectedOption)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedOption = options[indexPath.row]
        self.selectedOption = selectedOption
        tableView.reloadData()
        delegate?.didSelectOption(selectedOption)
        dismiss(animated: true, completion: nil)
    }
}

