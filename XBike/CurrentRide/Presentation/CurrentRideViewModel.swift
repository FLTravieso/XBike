//
//  CurrentRideViewModel.swift
//  XBike
//
//  Created by Frank Travieso on 29/03/2025.
//

import Foundation
import SwiftUI
import Combine
import CoreLocation
import GoogleMaps

@Observable
class CurrentRideViewModel {
    var formattedTime: String = "00 : 00 : 00"
    var formattedDistance: String = "0.0 km"
    var isRunning = false
    var rideFinished = false
    var userLocation = CLLocationCoordinate2D(latitude: Constants.Map.defaultLatitude,
                                              longitude: Constants.Map.defaultLongitude)
    var pathCoordinates = GMSMutablePath()

    private var timer: Timer?
    private var cancellables = Set<AnyCancellable>()

    private let timerUseCase: TimerUseCase
    private let locationTracker: LocationTrackerProtocol
    private let rideTracker: RideTrackerProtocol

    init(timerUseCase: TimerUseCase,
         locationTracker: LocationTrackerProtocol,
         rideTracker: RideTrackerProtocol
        )
    {
        self.timerUseCase = timerUseCase
        self.locationTracker = locationTracker
        self.rideTracker = rideTracker

        self.locationTracker.requestUserCurrentLocation()
        observeLocationUpdates()
    }

    func startRide() {
        startTimer()
        startTracking()
    }

    func stopRide() {
        stopTimer()
        stopTracking()
        let distance = rideTracker.endRide(at: CLLocation(latitude: userLocation.latitude,
                                           longitude: userLocation.longitude))

        updateFormattedDistance(with: distance)
        isRunning = false
        rideFinished = true
    }

    func saveRide() {
        Task {
            await rideTracker.saveRide(with: timerUseCase.getElapsedTime())
        }
    }

    func deleteRide() {
        resetTimer()
        rideTracker.resetRide()
        pathCoordinates.removeAllCoordinates()
        rideFinished = false
    }

    private func resetTimer() {
        stopTimer()
        timerUseCase.reset()
        updateFormattedTime()
    }

    private func startTimer() {
        isRunning = true
        timerUseCase.start()
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            guard let self else {
                return
            }

            self.updateFormattedTime()
        }
    }

    private func stopTimer() {
        isRunning = false
        timerUseCase.stop()
        timer?.invalidate()
        timer = nil
    }

    private func updateFormattedTime() {
        let timePassed = timerUseCase.getElapsedTime()
        let hours = Int(timePassed) / 3600
        let minutes = Int(timePassed) / 60
        let seconds = Int(timePassed) % 60

        Task { @MainActor in
            formattedTime = String(format: "%02d : %02d : %02d", hours, minutes, seconds)
        }
    }

    private func observeLocationUpdates() {
        locationTracker.locationPublisher
            .receive(on: DispatchQueue.main)
            .sink { [weak self] location in
                guard let self else {
                    return
                }

                self.userLocation = location.coordinate
                if isRunning {
                    self.rideTracker.didMoveTo(point: location)
                    self.pathCoordinates.add(location.coordinate)
                }
            }
            .store(in: &cancellables)
        }

    private func startTracking() {
        locationTracker.startUpdatingLocation()
    }

    private func stopTracking() {
        locationTracker.stopUpdatingLocation()
    }

    private func updateFormattedDistance(with distanceInMeters: Double) {
        let distanceInKm = distanceInMeters / 1000.0

        Task { @MainActor in
            formattedDistance = String(format: "%.2f km", distanceInKm)
        }
    }
}
