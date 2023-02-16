//
//  MapView.swift
//  GeoGo
//
//  Created by John Stennett on 2/16/23.
//

import SwiftUI
import MapKit
import Foundation


struct MapWithUserLocation: View {
    
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
            Map(coordinateRegion: region, interactionModes: .all, showsUserLocation: true, userTrackingMode: .constant(.follow))
                .ignoresSafeArea()
            
        }
    }
}
struct MapWithUserLocation_Previews: PreviewProvider {
    static var previews: some View {
        MapWithUserLocation()
    }
}
