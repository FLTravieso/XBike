//
//  CurrentRideTabFactory.swift
//  XBike
//
//  Created by Frank Travieso on 29/03/2025.
//
import SwiftData

class CurrentRideTabFactory: CreateCurrentRideTab {
    let context: ModelContext

    init(context: ModelContext) {
        self.context = context
    }

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
        RideRepository(context: context)
    }
}
