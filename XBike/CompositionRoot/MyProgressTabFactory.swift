//
//  MyProgressTabFactory.swift
//  XBike
//
//  Created by Frank Travieso on 30/03/2025.
//

import SwiftData

class MyProgressTabFactory: CreateMyProgressTab {
    let context: ModelContext

    init(context: ModelContext) {
        self.context = context
    }

    func create() -> MyProgressTabView {
        MyProgressTabView(viewModel: createViewModel())
    }

    private func createViewModel() -> MyProgressViewModel {
        MyProgressViewModel(fetchRidesUseCase: createFetchRidesUseCase())
    }

    private func createFetchRidesUseCase() -> FetchRidesUseCase {
        FetchRidesUseCase(repository: createRideRepository())
    }

    private func createRideRepository() -> RideRepository {
        RideRepository(context: context)
    }
}
