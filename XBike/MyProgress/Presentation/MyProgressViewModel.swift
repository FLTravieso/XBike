//
//  MyProgressViewModel.swift
//  XBike
//
//  Created by Frank Travieso on 30/03/2025.
//

import SwiftUI

@Observable
class MyProgressViewModel {
    var rides: [RideItem] = []
    
    private let fetchRidesUseCase: FetchRidesUseCase

    init(fetchRidesUseCase: FetchRidesUseCase) {
        self.fetchRidesUseCase = fetchRidesUseCase
    }

    func onAppear() {
        Task {
            let rides = await fetchRidesUseCase.execute()

            let rideItems = rides.map { ride in
                let timePassed = ride.time
                let hours = Int(timePassed) / 3600
                let minutes = Int(timePassed) / 60
                let seconds = Int(timePassed) % 60
            
                let formattedTime = String(format: "%02d : %02d : %02d", hours, minutes, seconds)

                let distanceInKm = ride.distance / 1000.0

                let formattedDistance = String(format: "%.2f km", distanceInKm)

                return RideItem(id: ride.id,
                                startingPlace: ride.startingAddress,
                                finishingPlace: ride.finishingAddress,
                                distance: formattedDistance,
                                time: formattedTime)
            }

            Task { @MainActor in
                self.rides = rideItems
            }
        }
    }
}
