

import Foundation

/// A set of cutom enum to handle the Error regarding the API Error.
enum APIError: Error {
    case noInternet
    case serverdown
    case unknown
    case invalid
    case custom(message: String)

}

extension APIError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .noInternet: return "Unable to connect to server. Please check your internet connection and try again."
        case .custom(message: let message): return message
        default:
            return ""
        }
    }
    
    var localizedDescription: String {
        switch self {
        case .noInternet: return "Unable to connect to server. Please check your internet connection and try again."
        case .custom(message: let message): return message
        default:
            return ""
        }
    }
    var code: Int {
        return self._code
    }
}
