//
//  CurrentWeatherResponseData.swift
//  Simple weather app
//
//  Created by Roman Antoniuk on 10.02.2024.
//

import Foundation

struct CurrentWeatherResponseData: Codable {
    
    let latitude: Double
    let longitude: Double
    let current: CurrentWeatherData
    
    enum CodingKeys: String, CodingKey {
        case latitude
        case longitude
        case current = "current_weather"
    }

}
