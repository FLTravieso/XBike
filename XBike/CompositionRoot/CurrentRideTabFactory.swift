//
//  CurrentRideTabFactory.swift
//  XBike
//
//  Created by Frank Travieso on 29/03/2025.
//
import SwiftData

class CurrentRideTabFactory: CreateCurrentRideTab {
    func create() -> CurrentRideTabView {
        CurrentRideTabView(viewModel: createViewModel())
    }

    private func createViewModel() -> CurrentRideViewModel {
        CurrentRideViewModel(timerUseCase: TimerManager(),
                             locationTracker: LocationTrackerService(),
                             rideTracker: createRideTracker())
    }

    private func createRideTracker() -> RideTrackerProtocol {
        RideTracker(reverseGeocoder: ReverseGeocodeRepository(),
                    saveRideUseCase: createSaveRideUseCase())
    }

    private func createSaveRideUseCase() -> SaveRideUseCase {
        SaveRideUseCase(repository: createRidesRepository())
    }

    private func createRidesRepository() -> RidesRepositoryType {
        RideRepository(context: createModelContext())
    }

    private func createModelContext() -> ModelContext {
        let schema = Schema([
            Ride.self,
        ])

        guard let container = try? ModelContainer(for: schema) else {
            fatalError("Could not create ModelContainer")
        }
        
        return ModelContext(container)
    }
}
