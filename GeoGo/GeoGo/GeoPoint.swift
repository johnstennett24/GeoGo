//
// Created by John Stennett on 2/27/23.
//

import MapKit
import Foundation

struct GeoPoint: Codable, Identifiable {

    var id = Int()
    var lat: CLLocationDegrees
    var lon: CLLocationDegrees
    var message: String

}

class GeoPoints: ObservableObject {

    var points: [GeoPoint] = []
    
}
