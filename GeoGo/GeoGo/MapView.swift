//
//  MapView.swift
//  GeoGo
//
//  Created by John Stennett on 2/16/23.
//

import SwiftUI
import MapKit
import Foundation
import SwiftyJSON

struct MapWithUserLocation: View {

    var items: [GeoPoint] =
            [
                GeoPoint(lat: 43.8144, lon:-111.7833, message: "Here it is")
            ]

    private static let ds = DataServices()
    @StateObject private var locationManager = LocationManager()

    var region: Binding<MKCoordinateRegion>? {
        guard let location = locationManager.location else {
            return MKCoordinateRegion.goldenGateRegion().getBinding()
        }

        let region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 500, longitudinalMeters: 500)

        return region.getBinding()
    }

    var body: some View {
        if let region = region {
            buildMap(region: region)
        }
    }

    private func buildMap(region: Binding<MKCoordinateRegion>) -> some View {

        Map(coordinateRegion: region, interactionModes: .all, showsUserLocation: true, userTrackingMode: .constant(.follow), annotationItems: items) {
                item in
                MapMarker(coordinate: CLLocationCoordinate2D(latitude: item.lat, longitude: item.lon))
            }
                    .ignoresSafeArea()
        }
}
