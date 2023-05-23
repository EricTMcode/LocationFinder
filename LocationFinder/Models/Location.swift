//
//  Location.swift
//  LocationFinder
//
//  Created by Eric on 23/05/2023.
//

import Foundation

struct Location: Codable {
    var country: String
    struct Place: Codable {
        var placeName: String
        var longitude: String
        var latitude: String
        
        enum CodingKeys: String, CodingKey {
            case placeName = "place name"
            case longitude
            case latitude
        }
    }
    var places: [Place]
}
