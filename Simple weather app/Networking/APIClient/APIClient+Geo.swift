//
//  APIClient+Geo.swift
//  Simple weather app
//
//  Created by Roman Antoniuk on 10.02.2024.
//

import Foundation

protocol APIGeoClientProtocol: AnyObject {
    
    func fetchAllCitiesResults(endpoint: API.Geo, completion: @escaping (Result<[CityData], RequestError>) -> Void)

}

extension APIClient: APIGeoClientProtocol {
    
    func fetchAllCitiesResults(endpoint: API.Geo, completion: @escaping (Result<[CityData], RequestError>) -> Void) {
        networkManager.fetch(endpoint: endpoint, completion: completion)
    }

}
