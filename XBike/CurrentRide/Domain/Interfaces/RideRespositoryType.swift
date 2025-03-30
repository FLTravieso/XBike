//
//  RideRespositoryType.swift
//  XBike
//
//  Created by Frank Travieso on 30/03/2025.
//

protocol RidesRepositoryType {
    func saveRide(with ride: CompletedRide) async -> Result<Void,RideDomainError>
}
