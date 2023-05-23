//
//  MapView.swift
//  LocationFinder
//
//  Created by Eric on 23/05/2023.
//

import SwiftUI
import MapKit

struct MapView: View {
    let latitude: Double
    let longitude: Double
    @State private var mapRegion: MKCoordinateRegion
    
    init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
        self.mapRegion = MKCoordinateRegion(
            center: CLLocationCoordinate2D(
                latitude: latitude,
                longitude: longitude),
            span: MKCoordinateSpan(
                latitudeDelta: 0.2,
                longitudeDelta: 0.2))
    }
    
    var body: some View {
        Map(coordinateRegion: $mapRegion)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(latitude: 40.7484445, longitude: -73.9894536)
    }
}
