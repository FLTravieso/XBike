//
//  CurrentRideTabFactory.swift
//  XBike
//
//  Created by Frank Travieso on 29/03/2025.
//

class CurrentRideTabFactory: CreateCurrentRideTab {
    func create() -> CurrentRideTabView {
        CurrentRideTabView(viewModel: createViewModel())
    }

    private func createViewModel() -> CurrentRideViewModel {
        CurrentRideViewModel(timerUseCase: TimerManager())
    }
}
