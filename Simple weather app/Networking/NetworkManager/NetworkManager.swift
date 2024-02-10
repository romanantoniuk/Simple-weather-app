//
//  NetworkManager.swift
//  Simple weather app
//
//  Created by Roman Antoniuk on 10.02.2024.
//

import Foundation

protocol NetworkManagerProtocol: AnyObject {
    
    func fetch<T: Codable>(endpoint: EndpointProtocol, completion: @escaping (Result<T, RequestError>) -> Void)
    
}

final class NetworkManager: NetworkManagerProtocol {
    
    private let session = URLSession.shared
        
    func fetch<T: Codable>(endpoint: EndpointProtocol, completion: @escaping (Result<T, RequestError>) -> Void) {
        guard let url = endpoint.url else {
            completion(.failure(.urlError))
            return
        }
        session.dataTask(with: url) { data, response, error in
            var result: Result<T, RequestError>
            defer {
                DispatchQueue.main.async {
                    completion(result)
                }
            }
            guard let httpUrlResponse = response as? HTTPURLResponse else {
                result = .failure(.unknown)
                return
            }
            guard (200...299).contains(httpUrlResponse.statusCode) else {
                result = .failure(.networkError(statusCode: httpUrlResponse.statusCode))
                return
            }
            if error == nil, let data = data  {
//                print(String(data: data, encoding: .utf8))
                guard let decodedData = try? JSONDecoder().decode(T.self, from: data) else {
                    result = .failure(.decodeError)
                    return
                }
                result = .success(decodedData)
            } else {
                result = .failure(.unknown)
            }
        }.resume()
    }
    
}
