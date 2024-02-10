//
//  API.swift
//  Simple weather app
//
//  Created by Roman Antoniuk on 10.02.2024.
//

import Foundation

enum API {
    
    enum Weather: EndpointProtocol {
        
        case current(_ city: CityData)
        
        var baseUrl: URL? {
            URL(string: "https://api.open-meteo.com")
        }
        
        var path: String {
            var path = "/v1"
            switch self {
            case .current(_):
                path.append("/forecast")
            }
            return path
        }
        
        var queryItems: [URLQueryItem] {
            switch self {
            case .current(let city):
                [
                    URLQueryItem(name: "latitude", value: "\(city.latitude)"),
                    URLQueryItem(name: "longitude", value: "\(city.longitude)"),
                    URLQueryItem(name: "current_weather", value: "true"),
                    URLQueryItem(name: "forecast_days", value: "0"),
                ]
            }
        }
        
    }
    
    enum Geo: EndpointProtocol {
        
        case allCities
        
        var baseUrl: URL? {
            URL(string: "https://raw.githubusercontent.com")
        }
        
        var path: String {
            switch self {
            case .allCities:
                "/JetSetExpert/cities-json/master/data/cities.json"
            }
        }
        
        var queryItems: [URLQueryItem] {
            switch self {
            case .allCities:
                []
            }
        }
        
    }
    
}
