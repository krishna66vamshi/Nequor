

import Foundation
import Alamofire

struct Router: URLRouter {
    static var headers: HTTPHeaders?
    


    static var baseURL: BaseUrl {
        return .prod
    }

}

