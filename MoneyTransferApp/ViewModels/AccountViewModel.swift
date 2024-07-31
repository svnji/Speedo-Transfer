//
//  AccountViewModel.swift
//  MoneyTransferApp
//
//  Created by Daddy on 31/07/2024.
//

import Foundation

class AccountViewModel {
    var balance: Double = 0.0
    var transactions: [Transaction] = []
    var errorMessage: String?
    
    func fetchBalance() {
        // Implement API call to fetch balance
    }
    
    func fetchTransactionHistory() {
        // Implement API call to fetch transaction history
    }
    
    func transferMoney(to recipient: String, amount: Double, completion: @escaping (Bool) -> Void) {
        // Implement API call to transfer money
    }
}
