//
//  Country.swift
//  LocationFinder
//
//  Created by Eric on 23/05/2023.
//

import Foundation

struct Country: Codable, Hashable {
    let name: String
    let code: String
    let range: String
    
    static var none: Country {
        Country(name: "Select Country", code: "XX", range: "")
    }
}
