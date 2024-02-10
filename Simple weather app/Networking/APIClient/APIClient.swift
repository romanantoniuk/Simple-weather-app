//
//  APIClient.swift
//  Simple weather app
//
//  Created by Roman Antoniuk on 10.02.2024.
//

import Foundation

protocol APIClientProtocol: APIWeatherClientProtocol, APIGeoClientProtocol {
    
    var networkManager: NetworkManagerProtocol { get }
    
}

final class APIClient: APIClientProtocol {
    
    var networkManager: NetworkManagerProtocol
    
    init() {
        networkManager = NetworkManager()
    }
        
}
