//
//  Endpoint.swift
//  Simple weather app
//
//  Created by Roman Antoniuk on 09.02.2024.
//

import Foundation

protocol EndpointProtocol {
    
    var baseUrl: URL? { get }
    var path: String { get }
    var queryItems: [URLQueryItem] { get }
    var url: URL? { get }
    
}

extension EndpointProtocol {
    
    var url: URL? {
        guard let baseUrl = baseUrl else { return nil }
        var components = URLComponents(url: baseUrl, resolvingAgainstBaseURL: true)!
        components.path = path
        components.queryItems = queryItems
        return components.url
    }
    
}

