//
//  RequestError.swift
//  Simple weather app
//
//  Created by Roman Antoniuk on 10.02.2024.
//

import Foundation

enum RequestError: Error {
    
    case urlError
    case networkError(statusCode: Int)
    case decodeError
    case unknown
    
}
