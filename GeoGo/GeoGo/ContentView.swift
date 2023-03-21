//
//  ContentView.swift
//  GeoGo
//
//  Created by John Stennett on 2/16/23.
//

import Foundation
import SwiftUI
import MapKit
import SwiftyJSON

struct ContentView: View {
    let ds = DataServices()
    @ObservedObject var items = GeoPoints()
    @State private var tog: Bool = false
    @ObservedObject var compassHeading = CompassHeading()
    var body: some View {
        ZStack {
            MapWithUserLocation().task {
                do {

                } catch {
                    fatalError("Not correct")
                }
            }
            VStack {
                Capsule().frame(width: 1, height: 5)
                ZStack {
                    ForEach(Marker.markers(), id: \.self) { marker in
                        CompassMarkerView(marker: marker,
                                compassDegrees: 0)
                    }
                }
                        .frame(width: 300,
                                height: 300)
                        .rotationEffect(Angle(degrees: compassHeading.degrees))
                        .statusBar(hidden: true)
            }
            Spacer()
        }
    }
}

struct Marker: Hashable {
    let degrees: Double
    let label: String

    init(degrees: Double, label: String = "") {
        self.degrees = degrees
        self.label = label
    }
    static func markers() -> [Marker] {
        [
            Marker(degrees: 0, label: "N"),
            Marker(degrees: 30),
            Marker(degrees: 60),
            Marker(degrees: 90, label: "E"),
            Marker(degrees: 120),
            Marker(degrees: 150),
            Marker(degrees: 180, label: "S"),
            Marker(degrees: 210),
            Marker(degrees: 240),
            Marker(degrees: 270, label: "w"),
            Marker(degrees: 300),
            Marker(degrees: 330)
        ]
    }

    func degreeText() -> String {
        String(format: "%.0f", degrees)
    }
}
