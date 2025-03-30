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
    var isRunning = false
    var userLocation = CLLocationCoordinate2D(latitude: Constants.Map.defaultLatitude,
                                              longitude: Constants.Map.defaultLongitude)
    var pathCoordinates = GMSMutablePath()

    private let timerUseCase: TimerUseCase
    private var timer: Timer?
    private var cancellables = Set<AnyCancellable>()
    private let locationTracker: LocationTrackerProtocol

    init(timerUseCase: TimerUseCase, locationTracker: LocationTrackerProtocol) {
        self.timerUseCase = timerUseCase
        self.locationTracker = locationTracker
        observeLocationUpdates()
    }

    func startRide() {
        startTimer()
        startTracking()
    }

    func stopRide() {
        stopTimer()
        stopTracking()
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
        Task { @MainActor in
            formattedTime = timerUseCase.getElapsedTime()
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
                self.pathCoordinates.add(location.coordinate)
            }
            .store(in: &cancellables)
        }

    private func startTracking() {
        locationTracker.startUpdatingLocation()
    }

    private func stopTracking() {
        locationTracker.stopUpdatingLocation()
    }
}
