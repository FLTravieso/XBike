//
//  RideTracker.swift
//  XBike
//
//  Created by Frank Travieso on 30/03/2025.
//

import CoreLocation

class RideTracker: RideTrackerProtocol {
    private var startCoordinate: CLLocation?
    private var endCoordinate: CLLocation?
    private var lastLocation: CLLocation?
    private var totalDistanceInMeters: Double = 0

    func endRide(at point: CLLocation) {
        endCoordinate = point
    }

    func didMoveTo(point: CLLocation) {
        if startCoordinate == nil {
            startCoordinate = point
            lastLocation = point
        } else {
            updateDistance(with: point)
        }
    }

    func saveRide() {
        //Implement store ride
    }

    func resetRide() {
        startCoordinate = nil
        endCoordinate = nil
        totalDistanceInMeters = 0
    }

    private func updateDistance(with point: CLLocation) {
        guard let lastLocation else {
            return
        }

        let distanceInMeters = point.distance(from: lastLocation)
        totalDistanceInMeters += distanceInMeters
        self.lastLocation = point
    }
}
