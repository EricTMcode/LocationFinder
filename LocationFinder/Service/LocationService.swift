//
//  LocationService.swift
//  LocationFinder
//
//  Created by Eric on 23/05/2023.
//

import Foundation

class LocationService: ObservableObject {
    @Published var countries: [Country] = []
    let baseURL = "https://api.zippopotam.us"
    
    struct LocationInfo {
        let placeName: String
        let state: String
        let longitude: Double
        let latitude: Double
    }
    
    @Published var locationInfo: LocationInfo?
    
    init() {
        loadCountries()
    }
    
    func loadCountries() {
        guard let url = Bundle.main.url(forResource: "Countries", withExtension: "json") else {
            fatalError("Failed to locate Countries.json in the bundle.")
        }
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load Countries.json in the bundle.")
        }
        
        do {
            countries = try JSONDecoder().decode([Country].self, from: data)
            countries.insert(Country.none, at: 0)
        } catch {
            fatalError("Failed to decode Countries.json from data.")
        }
    }
    
    @MainActor
    func fetchLocation(for countryCode: String, postalCode: String) async {
        
    }
}
