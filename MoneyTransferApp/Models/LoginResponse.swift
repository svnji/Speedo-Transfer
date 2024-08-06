//
//  LoginResponse.swift
//  MoneyTransferApp
//
//  Created by 1234 on 06/08/2024.
//

import Foundation

struct LoginResponse: Codable {
    let status: String
    let message: String
    let token: String?
    let tokenType: String?
}
