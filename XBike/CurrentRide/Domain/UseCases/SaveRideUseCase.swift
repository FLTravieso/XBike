//
//  SaveRideUseCase.swift
//  XBike
//
//  Created by Frank Travieso on 30/03/2025.
//

class SaveRideUseCase {
    private let repository: RidesRepositoryType
    
    init(repository: RidesRepositoryType) {
        self.repository = repository
    }
    
    func execute(with completedRide: CompletedRide) async -> Result<Void,RideDomainError> {
        return await repository.saveRide(with: completedRide)
    }
}
