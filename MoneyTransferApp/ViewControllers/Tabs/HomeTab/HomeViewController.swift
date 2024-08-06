//
//  MainViewController.swift
//  MoneyTransferApp
//
//  Created by Daddy on 31/07/2024.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {

 
   
    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var currentBalance: UILabel!
    
    @IBOutlet weak var recentTransactionDateAndStatus3: UILabel!
    @IBOutlet weak var recentTransactionMasterCard3: UILabel!
    @IBOutlet weak var recentTransactionValue3: UILabel!
    @IBOutlet weak var recentTransactionName3: UILabel!
    
    @IBOutlet weak var recentTransactionDateAndStatus2: UILabel!
    @IBOutlet weak var recentTransactionMasterCard2: UILabel!
    @IBOutlet weak var recentTransactionValue2: UILabel!
    @IBOutlet weak var recentTransactionName2: UILabel!
    
    @IBOutlet weak var recentTransactionDateAndStatus1: UILabel!
    @IBOutlet weak var recentTransactionMasterCard1: UILabel!
    @IBOutlet weak var recentTransactionValue1: UILabel!
    @IBOutlet weak var recentTransactionName1: UILabel!
    
    var recentTransactions : [Transaction] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        setupGradientBackground()
        setUpRecentTransactions()
    }
    
    
    private func setupGradientBackground() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = mainView.bounds
        if let MainViewColor = UIColor(named: "MainViewColor") {
            gradientLayer.colors = [MainViewColor.cgColor, UIColor.red.cgColor]
        } else {
            gradientLayer.colors = [UIColor.systemPink.cgColor, UIColor.red.cgColor]
        }
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 10.0)
        mainView.layer.insertSublayer(gradientLayer, at: 0)
    }
    func setUpRecentTransactions(){
        let transaction1 = Transaction(recipientName: "Anwar", MasterCardId: "1456", amount: "1500", date: "Today 12:00 - Recived")
        recentTransactions.append(transaction1)
        recentTransactionDateAndStatus1.text = transaction1.date
        recentTransactionMasterCard1.text = transaction1.MasterCardId
        recentTransactionValue1.text = transaction1.amount
        recentTransactionName1.text = transaction1.recipientName
        
    }
    @IBAction func transferBtnTapped(_ sender: Any) {
        self.goToFirstTransferScreen()
    }
    @IBAction func transactionsBtnTapped(_ sender: Any) {
        self.goToTransactionsScreen ()
    }
    @IBAction func cardsBtnTapped(_ sender: Any) {
        self.goCardsScreen ()
    }
    @IBAction func accountBTnTapped(_ sender: Any) {
        self.goAccountScreen ()
    }
    private func goToFirstTransferScreen (){
        let sb = UIStoryboard(name: StoryBoards.main, bundle: nil)
        let firstTransferViewController = sb.instantiateViewController(withIdentifier: VCs.firstTransferViewController) as! FirstTransferViewController
        self.navigationController?.pushViewController(firstTransferViewController, animated: true)
   
    }
    private func goToTransactionsScreen (){
        let sb = UIStoryboard(name: StoryBoards.main, bundle: nil)
        let transactionsVC = sb.instantiateViewController(withIdentifier: VCs.transactionDetailsViewController) as! transactionDetailsViewController
        self.navigationController?.pushViewController(transactionsVC, animated: true)
   
    }
    private func goCardsScreen (){
        let sb = UIStoryboard(name: StoryBoards.main, bundle: nil)
        let cardsVC = sb.instantiateViewController(withIdentifier: VCs.CardsViewController) as! CardsViewController
        self.navigationController?.pushViewController(cardsVC, animated: true)
   
    }
    private func goAccountScreen (){
        let sb = UIStoryboard(name: StoryBoards.main, bundle: nil)
        let accountVC = sb.instantiateViewController(withIdentifier: VCs.profileViewController) as! ProfileViewController
        self.navigationController?.pushViewController(accountVC, animated: true)
   
    }
}

