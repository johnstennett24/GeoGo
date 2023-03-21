//
// Created by John Stennett on 3/20/23.
//

import Foundation

import Foundation
import Combine
import CoreLocation

class CompassHeading: NSObject, ObservableObject, CLLocationManagerDelegate {
    var objectWillChange = PassthroughSubject<Void, Never>()
    var degrees: Double = .zero {
        didSet {
            objectWillChange.send()
        }
    }

    private let locationManager: CLLocationManager

    override init() {
        locationManager = CLLocationManager()
        super.init()

        locationManager.delegate = self
        setup()
    }

    private func setup() {
        locationManager.requestWhenInUseAuthorization()

        if CLLocationManager.headingAvailable() {
            locationManager.startUpdatingLocation()
            locationManager.startUpdatingHeading()
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        degrees = -1 * newHeading.magneticHeading
    }
}