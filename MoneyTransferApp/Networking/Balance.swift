import Foundation

enum AccountServiceError: Error {
    case invalidResponse
    case networkError
    case serverError
    case decodingError
}

class AccountService {
    static let shared = AccountService()
    private init() {}
    
    func fetchAccountBalance(with token: String, completion: @escaping (Result<Double, AccountServiceError>) -> Void) {
        guard let url = URL(string: "https://speedotransfer1-506cf0850222.herokuapp.com/api/balance") else {
            completion(.failure(.invalidResponse))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Network error: \(error.localizedDescription)")
                completion(.failure(.networkError))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                completion(.failure(.serverError))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidResponse))
                return
            }
            
            if let balance = Double(String(data: data, encoding: .utf8)?.trimmingCharacters(in: .whitespacesAndNewlines) ?? "") {
                completion(.success(balance))
            } else {
                completion(.failure(.decodingError))
            }
        }
        
        task.resume()
    }
}
