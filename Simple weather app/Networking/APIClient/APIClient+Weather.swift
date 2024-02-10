//
//  APIClient+Weather.swift
//  Simple weather app
//
//  Created by Roman Antoniuk on 10.02.2024.
//

import Foundation

protocol APIWeatherClientProtocol: AnyObject {
    
    func fetchCurrentWeather(endpoint: API.Weather, completion: @escaping (Result<CurrentWeatherResponseData, RequestError>) -> Void)

}

extension APIClient: APIWeatherClientProtocol {
    
    func fetchCurrentWeather(endpoint: API.Weather, completion: @escaping (Result<CurrentWeatherResponseData, RequestError>) -> Void) {
        networkManager.fetch(endpoint: endpoint, completion: completion)
    }

}
