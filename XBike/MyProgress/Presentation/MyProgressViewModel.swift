//
//  MyProgressViewModel.swift
//  XBike
//
//  Created by Frank Travieso on 30/03/2025.
//

import SwiftUI

@Observable
class MyProgressViewModel {
    var rides: [CompletedRide] = []
    
    private let fetchRidesUseCase: FetchRidesUseCase

    init(fetchRidesUseCase: FetchRidesUseCase) {
        self.fetchRidesUseCase = fetchRidesUseCase
    }

    func onAppear() {
        Task {
            let rides = await fetchRidesUseCase.execute()

            Task { @MainActor in
                self.rides = rides
            }
        }
    }
}
