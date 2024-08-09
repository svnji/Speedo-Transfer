//
//  Transaction.swift
//  MoneyTransferApp
//
//  Created by Daddy on 31/07/2024.
//

import Foundation

struct Transaction: Codable {
    var id: String
    var recipientName: String
    var amount: Double
    var date: String
}
