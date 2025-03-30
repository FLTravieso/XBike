//
//  RideTrackerUseCase.swift
//  XBike
//
//  Created by Frank Travieso on 30/03/2025.
//

import CoreLocation

protocol RideTrackerProtocol {
    func endRide(at point: CLLocation) -> Double
    func didMoveTo(point: CLLocation)
    func saveRide()
    func resetRide()
}
