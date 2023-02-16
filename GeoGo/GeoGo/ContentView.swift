//
//  ContentView.swift
//  GeoGo
//
//  Created by John Stennett on 2/16/23.
//

import Foundation
import SwiftUI
import MapKit


struct ContentView: View {
    var body: some View {
        ZStack {
            MapWithUserLocation()
        }
    }
}

