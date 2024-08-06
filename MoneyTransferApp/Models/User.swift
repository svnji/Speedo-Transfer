//
//  User.swift
//  MoneyTransferApp
//
//  Created by Daddy on 31/07/2024.
//
import Foundation

struct UserRegistrationRequest: Codable {
    var firstName: String
    var lastName: String
    var email: String
    var password: String
    var userName: String
    var country: String
    var dateOfBirth: String

    enum CodingKeys: String, CodingKey {
        case firstName
        case lastName
        case email
        case password
        case userName
        case country
        case dateOfBirth
    }
}
