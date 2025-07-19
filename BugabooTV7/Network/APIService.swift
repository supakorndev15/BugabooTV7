//
//  APIService.swift
//  BugabooTV7
//
//  Created by MacDetail on 19/7/2568 BE.
//

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
