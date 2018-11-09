
import Foundation
enum BaseUrl: String {

    case prod

    var value: String {
        switch self {
        case .prod: return "http://45.232.252.136/api"
        }
    }
}
