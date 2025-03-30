//
//  RideRepository.swift
//  XBike
//
//  Created by Frank Travieso on 30/03/2025.
//
import SwiftData

class RideRepository: RidesRepositoryType {
    private let context: ModelContext

    init(context: ModelContext) {
        self.context = context
    }

    func saveRide(with completedRide: CompletedRide) async -> Result<Void, RideDomainError> {
        let newRide = Ride(id: completedRide.id,
                           startingAddress: completedRide.startingAddress,
                           finishingAddress: completedRide.finishingAddress,
                           distance: completedRide.distance,
                           time: completedRide.time)

        context.insert(newRide)

        do {
            try context.save()
            return .success(())
        } catch {
            return .failure(.storageError)
        }
    }

    func fetchRides() async -> [Ride] {
        let descriptor = FetchDescriptor<Ride>()
        do {
            let rides = try context.fetch(descriptor)
            
            return rides
        } catch {
            return []
        }
    }
}
