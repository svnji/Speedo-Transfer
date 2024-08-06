import Foundation

class Session {
    static let shared = Session()
    private init() {}
    
    var authToken: String = "" // Provide a default value
}
