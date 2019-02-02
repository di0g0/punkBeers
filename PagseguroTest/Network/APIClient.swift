import Foundation
import Alamofire

enum APIClientError: Error {
    case jsonParsingError
    case serverError
    case other
    
    var localizedDescription: String {
        return "Ocorreu um erro, tente novamente mais tarde."
    }
}

protocol APIClient {
    func request(_ request: URLRequestConvertible, completion: @escaping ((Data?, Error?) -> Void))
}

extension APIClient {
    func request(_ request: URLRequestConvertible, completion: @escaping ((Data?, Error?) -> Void)) {
        Alamofire.request(request)
            .validate()
            .responseData { (response) in
                guard response.result.isSuccess,
                let data = response.result.value else {
                    completion(nil, APIClientError.serverError)
                    return
                }
                
                completion(data, nil)
        }
    }
}
