//
//  LocationFinderView.swift
//  LocationFinder
//
//  Created by Eric on 23/05/2023.
//

import SwiftUI

struct LocationFinderView: View {
    @StateObject var locationService = LocationService()
    @State private var selectedCountry = Country.none
    
    var body: some View {
        NavigationStack {
            VStack {
                Picker("Select Country", selection: $selectedCountry) {
                    ForEach(locationService.countries, id: \.code) { country in
                        Text(country.name).tag(country)
                    }
                }
                .buttonStyle(.bordered)
                Spacer()
            }
            .navigationTitle("LocationFinder")
        }
    }
}

struct LocationFinderView_Previews: PreviewProvider {
    static var previews: some View {
        LocationFinderView()
    }
}
