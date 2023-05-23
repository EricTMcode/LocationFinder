//
//  LocationFinderView.swift
//  LocationFinder
//
//  Created by Eric on 23/05/2023.
//

import SwiftUI

struct LocationFinderView: View {
    @StateObject var locationService = LocationService()
    @State private var code = ""
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
                if selectedCountry != .none {
                    Text(selectedCountry.range)
                    Text("Postal Code/Zip Range")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    TextField("Code", text: $code)
                        .textFieldStyle(.roundedBorder)
                        .frame(width: 100)
                    Button("Get Location") {
                        Task {
                            await locationService.fetchLocation(for: selectedCountry.code, postalCode: code)
                        }
                    }
                    .buttonStyle(.borderedProminent)
                    .disabled(code.isEmpty)
                    if let errorString = locationService.errorString {
                        Text(errorString)
                            .foregroundColor(.red)
                    }
                    if let locationInfo = locationService.locationInfo {
                        Text(locationInfo.placeName)
                        Text(locationInfo.state)
                        if locationService.errorString == nil {
                            MapView(latitude: locationInfo.latitude, longitude: locationInfo.longitude)
                                .padding()
                        }
                    }
                }
                if locationService.locationInfo == nil {
                    Image("locationFinder")
                }
                Spacer()
            }
            .navigationTitle("LocationFinder")
            .onChange(of: selectedCountry) { _ in
                code = ""
            }
            .onChange(of: code) { _ in
                locationService.reset()
            }
        }
    }
}

struct LocationFinderView_Previews: PreviewProvider {
    static var previews: some View {
        LocationFinderView()
    }
}
