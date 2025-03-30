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
    
    func execute() async -> Result<Void,RideDomainError> {
        return await repository.saveRide()
    }
}
