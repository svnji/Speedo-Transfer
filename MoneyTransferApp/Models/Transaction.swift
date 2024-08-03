//
//  Transaction.swift
//  MoneyTransferApp
//
//  Created by Daddy on 31/07/2024.
//

import Foundation

struct Transaction: Codable {
    var recipientName: String
    var MasterCardId: String
    var amount: String
    var date: String
}
