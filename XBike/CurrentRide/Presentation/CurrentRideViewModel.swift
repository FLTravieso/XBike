//
//  CurrentRideViewModel.swift
//  XBike
//
//  Created by Frank Travieso on 29/03/2025.
//

import Foundation
import SwiftUI

@Observable
class CurrentRideViewModel {
    var formattedTime: String = "00 : 00 : 00"
    var isRunning = false

    private let timerUseCase: TimerUseCase
    private var timer: Timer?

    init(timerUseCase: TimerUseCase) {
        self.timerUseCase = timerUseCase
    }

    func resetTimer() {
        stopTimer()
        timerUseCase.reset()
        updateFormattedTime()
    }

    func startTimer() {
        isRunning = true
        timerUseCase.start()
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            guard let self else {
                return
            }

            self.updateFormattedTime()
        }
    }

    func stopTimer() {
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

}
