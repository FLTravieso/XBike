//
//  Ride.swift
//  XBike
//
//  Created by Frank Travieso on 30/03/2025.
//

import SwiftData
import Foundation

@Model
class Ride {
    var startingAddress: String
    var finishingAddress: String
    var distance: Double
    var time: TimeInterval

    init(startingAddress: String, finishingAddress: String, distance: Double, time: TimeInterval) {
        self.startingAddress = startingAddress
        self.finishingAddress = finishingAddress
        self.distance = distance
        self.time = time
    }
}
