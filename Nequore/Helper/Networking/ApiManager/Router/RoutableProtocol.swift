

import Foundation
import Alamofire

protocol URLRouter {
    static var baseURL: BaseUrl { get }
    static var headers: HTTPHeaders? { get }
}

/// This protocol will allow us to define the Request parameters and route
/// Typically this is conformed to by methods routes.
protocol Routable {
    var route: String { get set }
    var urlParams: String? { get set }
    init()
}

/// Allows a route to perform the `.get` method
protocol Readable: Routable { }

/// Allows a route to perform the `.post` method
protocol Creatable: Routable { }

/// Allows a route to perform the `.put` method
protocol Updatable: Routable { }

/// Allows a route to perform the `.patch` method
protocol Patchable: Routable { }

/// Allows a route to perform the `.delete` method
protocol Deletable: Routable { }

extension Routable {

    /// Create instance of Object that conforms to Routable
    init(_ _arg: String = "") {
        self.init()
        urlParams = _arg
    }

    /// Allows a route to become a nested route
    func route(args: String, child: RequestConvertable) -> RequestConverter {
        return RequestConverter(
            method: child.method,
            route: "\(self.route)/\(args)/\(child.route)",
            parameters: child.parameters
        )
    }

    /// Generate the URL string for generated nested routes
    func route(parent: Routable, child: Routable) -> String {
        if let params = parent.urlParams {
            return parent.route + "/" + params + "/" + child.route
        } else {
            return parent.route + "/" + child.route
        }
    }
}

extension Readable {
    /// Method that allows route to return an object
    ///
    /// - Parameter params: Parameters of the object that is being returned
    /// - Returns: `URLRequestConvertible` object to play nicely with Alamofire
    /// ````
    /// Router.User.get(params: "2")
    ///````
    static func get(params: String? = nil) -> RequestConverter {
        let temp = Self.init()
        
        var route = temp.route
        if let parameters = params {
             route = "\(temp.route)/\(parameters)"
        }
     
        return RequestConverter(method: .get, route: route)
    }
    
    static func get(subRoute: String? = nil, parameters: Parameters?) -> RequestConverter {
        let temp = Self.init()
        var route = temp.route

        if let subRoute = subRoute {
            route = "\(temp.route)/\(subRoute)"
        }
        return RequestConverter(method: .get, route: route, parameters: parameters, encoding: URLEncoding.default)
    }
}

extension Creatable {

    /// Method that allows route to create an object
    ///
    /// - Parameter parameters: Dictionary of objects that will be used to create object
    /// - Returns: `URLRequestConvertible` object to play nicely with Alamofire
    /// ````
    ///````
    static func create(parameters: Parameters? = nil) -> RequestConverter {
        let temp = Self.init()
        let route = "\(temp.route)"
        return RequestConverter(method: .post, route: route, parameters: parameters)
    }
}

extension Updatable {

    /// Method that allows route to update an object
    ///
    /// - Parameter parameters: Dictionary of objects that will be used to create object
    /// - Returns: `URLRequestConvertible` object to play nicely with Alamofire
    /// ````
    ///````
    static func update(subRoute: String? = nil, parameters: Parameters) -> RequestConverter {
        let temp = Self.init()
        var route = "\(temp.route)"
        if let subRoute = subRoute {
            route += "/" + subRoute
        }
        return RequestConverter(method: .put, route: route, parameters: parameters)
    }
}

extension Patchable {
    
    /// Method that allows route to update an object
    ///
    /// - Parameter parameters: Dictionary of objects that will be used to create object
    /// - Returns: `URLRequestConvertible` object to play nicely with Alamofire
    /// ````
    ///````
    static func update(subRoute: String? = nil, parameters: Parameters) -> RequestConverter {
        let temp = Self.init()
        var route = "\(temp.route)"
        if let subRoute = subRoute {
            route += "/" + subRoute
        }
        return RequestConverter(method: .patch, route: route, parameters: parameters)
    }
}


extension Deletable {

    /// Method that allows route to delete an object
    ///
    /// - Parameter params: Parameters of the object that is being deleted
    /// - Returns: `URLRequestConvertible` object to play nicely with Alamofire
    /// ````
    /// Router.User.delete(params: "2")
    ///````
    static func delete(params: String) -> RequestConverter {
        let temp = Self.init()
        let route = "\(temp.route)/\(params)"
        return RequestConverter(method: .delete, route: route)
    }
}

protocol RequestConvertable: Alamofire.URLRequestConvertible {
    var method: HTTPMethod { get set }
    var route: String { get set }
    var parameters: Parameters? { get set }
    var encoding: ParameterEncoding { get set }
}

struct RequestConverter: RequestConvertable {
    var method: HTTPMethod
    var route: String
    var parameters: Parameters?
    var encoding: ParameterEncoding

    /// Create a RequestConverter object
    ///
    /// - Parameters:
    ///   - method: Method to perform on router. Example: `.get`, `.post`, etc.
    ///   - route: Route endpoint on url.
    ///   - parameters: Optional dictionary to pass in objects. Used for `.post` and `.put`
    ///   - encoding: encoding technique used in the application.
    init(method: HTTPMethod, route: String, parameters: Parameters? = nil, encoding: ParameterEncoding = JSONEncoding.default) {
        self.method = method
        self.route = route
        self.parameters = parameters
        self.encoding = encoding
    }

    /// Required method to conform to the `URLRequestConvertible` protocol.
    ///
    /// - Returns: URLRequest object
    /// - Throws: An `Error` if the underlying `URLRequest` is `nil`.
    
    
    func asURLRequest() throws -> URLRequest {
        //let url = try Router.baseURL.value.asURL()
        let urlString = String(format: "%@%@",Router.baseURL.value,route )
        let apiUrl = URL(string: urlString.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)!)
        
        var req = URLRequest(url: apiUrl!, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 40)
        req.httpMethod = method.rawValue
        req.allHTTPHeaderFields = Router.headers
        switch encoding {
        case is JSONEncoding:
            return try JSONEncoding.default.encode(req, with: parameters)
        default:
            return try JSONEncoding.default.encode(req, with: parameters)
        }

    }
}
