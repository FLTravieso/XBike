//
//  RideItem.swift
//  XBike
//
//  Created by Frank Travieso on 30/03/2025.
//

import Foundation

struct RideItem: Identifiable {
    let id: UUID
    let startingPlace: String
    let finishingPlace: String
    let distance: String
    let time: String
}
