//
//  FetchRidesUseCase.swift
//  XBike
//
//  Created by Frank Travieso on 30/03/2025.
//

class FetchRidesUseCase {
    private let repository: RidesRepositoryType

    init(repository: RidesRepositoryType) {
        self.repository = repository
    }

    func execute() async -> [CompletedRide] {
        let rides = await repository.fetchRides()

        return rides.map { ride in
            CompletedRide(startingAddress: ride.startingAddress,
                          finishingAddress: ride.finishingAddress,
                          distance: ride.distance,
                          time: ride.time
            )
        }
    }
}
