//
//  AuthViewModel.swift
//  MoneyTransferApp
//
//  Created by Daddy on 31/07/2024.
//

import Foundation

class AuthViewModel {
    var user: User?
    var errorMessage: String?
    
    func register(name: String, email: String, password: String, completion: @escaping (Bool) -> Void) {
        AuthService.shared.register(name: name, email: email, password: password) { result in
            switch result {
            case .success(let user):
                self.user = user
                completion(true)
            case .failure(let error):
                self.errorMessage = error.localizedDescription
                completion(false)
            }
        }
    }
    
    func login(email: String, password: String, completion: @escaping (Bool) -> Void) {
        AuthService.shared.login(email: email, password: password) { result in
            switch result {
            case .success(let user):
                self.user = user
                completion(true)
            case .failure(let error):
                self.errorMessage = error.localizedDescription
                completion(false)
            }
        }
    }
    
    func logout(completion: @escaping (Bool) -> Void) {
        AuthService.shared.logout { result in
            switch result {
            case .success(let success):
                if success {
                    self.user = nil
                    completion(true)
                }
            case .failure(let error):
                self.errorMessage = error.localizedDescription
                completion(false)
            }
        }
    }
}
