//
//  AuthService.swift
//  MoneyTransferApp
//
//  Created by Daddy on 31/07/2024.
//

import Foundation

class AuthService {
    static let shared = AuthService()
    private init() {}
    
    func register(name: String, email: String, password: String, completion: @escaping (Result<User, Error>) -> Void) {
        // Implement API call for registration
    }
    
    func login(email: String, password: String, completion: @escaping (Result<User, Error>) -> Void) {
        // Implement API call for login
    }
    
    func logout(completion: @escaping (Result<Bool, Error>) -> Void) {
        // Implement API call for logout
    }
}
