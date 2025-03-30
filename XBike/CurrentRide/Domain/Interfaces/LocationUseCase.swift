//
//  LocationUseCase.swift
//  XBike
//
//  Created by Frank Travieso on 30/03/2025.
//

import CoreLocation
import Combine

protocol LocationTrackerProtocol {
    func startUpdatingLocation()
    func stopUpdatingLocation()

    var locationPublisher: AnyPublisher<CLLocation, Never> { get }
}
