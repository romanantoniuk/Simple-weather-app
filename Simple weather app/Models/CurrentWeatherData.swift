//
//  CurrentWeatherData.swift
//  Simple weather app
//
//  Created by Roman Antoniuk on 10.02.2024.
//

import Foundation

struct CurrentWeatherData: Codable {
    
    let temperature: Double
    let windSpeed: Double
    
    enum CodingKeys: String, CodingKey {
        case temperature = "temperature"
        case windSpeed = "windspeed"
    }
    
}
