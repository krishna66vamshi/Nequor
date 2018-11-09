

import Foundation
import Alamofire
import PromiseKit
import ObjectMapper

protocol Logoutable {

}

class Parser: Logoutable {
    class func parse (responseData: Any, data:PMKAlamofireDataResponse) -> Promise<(Parameters, PMKAlamofireDataResponse)> {
        return Promise { seal in
            guard let result = responseData as? Parameters else {
                return seal.reject(APIError.invalid)
            }
            if let success = result["success"] as? String {
                if success == "1" {
                 return seal.fulfill((result, data))
                } else {
                    return seal.reject(APIError.invalid)
                }
            }
            else
            if let message = result["message"] as? String {
                return seal.reject(APIError.custom(message: message))
            } else {
                return seal.reject(APIError.invalid)
            }
        }
    }
}

extension Logoutable where Self: Parser {
    func logout(withMessage message: String) {

    }
}
