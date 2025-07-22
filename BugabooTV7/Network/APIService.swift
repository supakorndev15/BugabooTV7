
import Foundation
import Alamofire

class APIService {
    static let shared = APIService()

    private init() {}

    // Generic function to call any API and decode it
    // APIEndpoint มาใช้
    func request<T: Decodable>(endpoint: APIEndpoint,
                                personalized: Bool = false,
                                completion: @escaping (Result<T, Error>) -> Void) {
        let fullURL = endpoint.url(personalized: personalized)

        AF.request(fullURL)
            .validate()
            .responseDecodable(of: T.self) { response in
                switch response.result {
                case .success(let decodedData):
                    completion(.success(decodedData))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}

// https://bff-web-api.bugaboo.tv/bff-web/v1/navigation/highlight-menu?personalized=false
// https://bff-web-api.bugaboo.tv/bff-web/v1/fetch-seo/th%2F
