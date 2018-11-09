
import Foundation
import ObjectMapper
import PromiseKit

typealias Success<T> = (_ obj: T, _ data: PMKAlamofireDataResponse) -> ()
typealias Response = Alamofire.Parameters



class ApiManager: Alamofire.SessionManager {

    static let shared: ApiManager = {
        let configuration = Alamofire.SessionManager.default.session.configuration
        Sniffer.enable(in: configuration)
        let manager = ApiManager(configuration: configuration)
        return manager
    }()

    func request<T:Mappable>(request: RequestConverter, with object: T.Type) -> Promise<(T, PMKAlamofireDataResponse)> {
        return Promise { seal in
            self.request(request)
                .validate()
                .responseJSON()
                .then({ (data, response) in
                    Parser.parse(responseData: data, data: response)
                })
                .then({ (result, data) in
                    self.map(data: result, to: object, responseData: data)
                })
                .done({ (obj, data) in
                    return seal.fulfill((obj, data))
                })
                .catch({ (error) in
                    return seal.reject(error)
                })
        }

    }    
    
    private func map<T:Mappable>(data: Parameters, to object: T.Type, responseData: PMKAlamofireDataResponse) -> Promise<(T, PMKAlamofireDataResponse)> {
        return Promise { seal in
            if let dictionary = data["data"] as? [String : Any], let result = Mapper<T>().map(JSON:dictionary ) {
                return seal.fulfill((result, responseData))
            } else {
                return seal.reject(APIError.invalid)
            }
        }
    }


}
