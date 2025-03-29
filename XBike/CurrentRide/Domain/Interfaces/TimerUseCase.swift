//
//  TimerUseCase.swift
//  XBike
//
//  Created by Frank Travieso on 29/03/2025.
//

import Foundation

protocol TimerUseCase {
    func start()
    func stop()
    func reset()
    func getElapsedTime() -> String

    var isRunning: Bool { get set }
}
