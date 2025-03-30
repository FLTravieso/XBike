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

    private let reverseGeocoder: ReverseGeocoderRepositoryProtocol
    private let saveRideUseCase: SaveRideUseCase

    init(reverseGeocoder: ReverseGeocoderRepositoryProtocol,
         saveRideUseCase: SaveRideUseCase) {
        self.reverseGeocoder = reverseGeocoder
        self.saveRideUseCase = saveRideUseCase
    }

    func endRide(at point: CLLocation) -> Double {
        endCoordinate = point
        return totalDistanceInMeters
    }

    func didMoveTo(point: CLLocation) {
        if startCoordinate == nil {
            startCoordinate = point
            lastLocation = point
        } else {
            updateDistance(with: point)
        }
    }

    func saveRide(with time: TimeInterval) async {
        guard let startCoordinate,
              let endCoordinate else {
            return
        }

        let startingAddressResult = await reverseGeocoder.getAddress(for: startCoordinate.coordinate)
        let finishingAddressResult = await reverseGeocoder.getAddress(for: endCoordinate.coordinate)

        guard let startingAddress = try? startingAddressResult.get(),
              let finishingAddress = try? finishingAddressResult.get() else {
            return
        }

        let completedRide = CompletedRide(startingAddress: startingAddress,
                                          finishingAddress: finishingAddress,
                                          distance: totalDistanceInMeters,
                                          time: time)

        await saveRideUseCase.execute(with: completedRide)
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
