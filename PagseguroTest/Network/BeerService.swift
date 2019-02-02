import Foundation
class BeerServices: APIClient {
    func getBeers(completion:@escaping (_ error: Error?, _ beerList:[BeerViewModel]) -> Void) {
        self.request(APIRouter.getBeers) {[weak self] (data, error) in
            guard let data = data else {
                completion(error, [])
                return
            }
            
            guard let beers = self?.parseBeerResponse(data) else {
                completion(APIClientError.jsonParsingError, [])
                return
            }
            let vms = beers.compactMap {BeerViewModel(beer: $0)}
            completion(nil, vms)
        }
    }
    
    func parseBeerResponse(_ data: Data) -> [Beer]? {
        do {
            let decoder = JSONDecoder()
            let beerList = try decoder.decode([Beer].self, from: data)
            return beerList
        }
        catch {
            return nil
        }
    }
}

