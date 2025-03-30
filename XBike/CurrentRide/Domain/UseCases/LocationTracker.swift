//
//  LocationTracker.swift
//  XBike
//
//  Created by Frank Travieso on 30/03/2025.
//

import CoreLocation
import Combine

@Observable
class LocationTrackerService: NSObject, LocationTrackerProtocol {
    private let locationManager = CLLocationManager()
    private let locationSubject = PassthroughSubject<CLLocation, Never>()

    var locationPublisher: AnyPublisher<CLLocation, Never> {
        locationSubject.eraseToAnyPublisher()
    }

    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }

    func startUpdatingLocation() {
        locationManager.startUpdatingLocation()
    }

    func stopUpdatingLocation() {
        locationManager.stopUpdatingLocation()
    }
}

extension LocationTrackerService: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            locationSubject.send(location)
        }
    }
}
