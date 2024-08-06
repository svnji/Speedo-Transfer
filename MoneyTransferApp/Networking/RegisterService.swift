//
//  RegisterService.swift
//  MoneyTransferApp
//
//  Created by 1234 on 06/08/2024.
//

import Foundation

struct AuthService {
    
    static func registerUser(with user: UserRegistrationRequest, completion: @escaping (Result<[String: Any], Error>) -> Void) {
        guard let url = URL(string: "https://speedotransfer1-506cf0850222.herokuapp.com/api/auth/register") else {
            completion(.failure(NSError(domain: "Invalid URL", code: 400, userInfo: nil)))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            let jsonData = try JSONEncoder().encode(user)
            request.httpBody = jsonData
        } catch {
            completion(.failure(error))
            return
        }
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200,
                  let data = data else {
                let statusError = NSError(domain: "Invalid response or data", code: (response as? HTTPURLResponse)?.statusCode ?? 500, userInfo: nil)
                completion(.failure(statusError))
                return
            }
            
            // Handle the response
            do {
                if let jsonResponse = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                    completion(.success(jsonResponse))
                }
            } catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
}
