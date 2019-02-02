import Foundation
import Alamofire

enum APIRouter: URLRequestConvertible {
    static let baseUrl = "https://api.punkapi.com/v2/"
    case getBeers
    
    private var path: String {
        switch self {
        case .getBeers:
            return "/beers"
        }
    }
    
    private var method: HTTPMethod {
        switch self {
        case .getBeers:
            return .get
        }
    }
    
    private var parameters: Parameters? {
        return nil
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = try APIRouter.baseUrl.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        urlRequest.httpMethod = method.rawValue
        urlRequest.httpShouldHandleCookies = true
        
        if method == .post {
            urlRequest = try JSONEncoding.default.encode(urlRequest, with: parameters)
        } else {
            urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
        }
        
        return urlRequest
    }
}
