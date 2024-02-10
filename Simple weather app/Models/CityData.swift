//
//  CityData.swift
//  Simple weather app
//
//  Created by Roman Antoniuk on 10.02.2024.
//

import Foundation
import RealmSwift

class CityData: Object, Codable, ObjectKeyIdentifiable {
    
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var name: String = ""
    @Persisted var country: String = ""
    @Persisted var latitude: String = ""
    @Persisted var longitude: String = ""
    
    convenience init(name: String, country: String, latitude: String, longitude: String) {
        self.init()
        self.name = name
        self.country = country
        self.latitude = latitude
        self.longitude = longitude
    }
    
    override class func primaryKey() -> String? {
        "id"
    }
    
    enum CodingKeys: String, CodingKey {
        case name = "city"
        case country
        case latitude = "lat"
        case longitude = "lng"
    }
    
}
