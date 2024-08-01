//
//  String+trimm.swift
//  MoneyTransferApp
//
//  Created by 1234 on 01/08/2024.
//

import Foundation
extension String {
    var trimmed : String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
