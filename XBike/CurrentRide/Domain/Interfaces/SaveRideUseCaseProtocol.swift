//
//  SaveRideUseCaseProtocol.swift
//  XBike
//
//  Created by Frank Travieso on 30/03/2025.
//

protocol RidesRepositoryType {
    func saveRide() async -> Result<Void,RideDomainError>
}
