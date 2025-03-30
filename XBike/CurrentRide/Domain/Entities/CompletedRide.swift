//
//  CompletedRide.swift
//  XBike
//
//  Created by Frank Travieso on 30/03/2025.
//
import Foundation

struct CompletedRide {
    let id = UUID()
    var startingAddress: String
    var finishingAddress: String
    var distance: Double
    var time: TimeInterval
}
