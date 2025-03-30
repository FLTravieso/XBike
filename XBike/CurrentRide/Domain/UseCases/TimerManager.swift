//
//  TimerManager.swift
//  XBike
//
//  Created by Frank Travieso on 29/03/2025.
//

import Foundation

class TimerManager: TimerUseCase {
    var isRunning: Bool = false
    private var startTime: Date?
    private var elapsedTime: TimeInterval = 0

    func start() {
        startTime = Date().addingTimeInterval(-elapsedTime)
        isRunning = true
    }

    func stop() {
        elapsedTime = elapsedTimeSinceStart()
        isRunning = false
    }

    func reset() {
        startTime = nil
        elapsedTime = 0
        isRunning = false
    }

    func getElapsedTime() -> String {
        let timePassed = isRunning ? elapsedTimeSinceStart() : elapsedTime
        let hours = Int(timePassed) / 3600
        let minutes = Int(timePassed) / 60
        let seconds = Int(timePassed) % 60

        return String(format: "%02d : %02d : %02d", hours, minutes, seconds)
    }

    private func updateTime() {
        elapsedTime = elapsedTimeSinceStart()
    }

    private func elapsedTimeSinceStart() -> TimeInterval {
        isRunning ? Date().timeIntervalSince(startTime ?? Date()) : elapsedTime
    }
}
