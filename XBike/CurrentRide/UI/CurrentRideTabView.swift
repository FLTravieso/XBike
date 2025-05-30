//
//  CurrentRideTabView.swift
//  XBike
//
//  Created by Frank Travieso on 29/03/2025.
//

import SwiftUI

struct CurrentRideTabView:View {
    @State private var showTrackingView: Bool
    @State private var viewModel: CurrentRideViewModel

    init(viewModel: CurrentRideViewModel) {
        self.showTrackingView = false
        self.viewModel = viewModel
    }

    var body: some View {
        NavigationStack {
            ZStack {
                MapView(userLocation: $viewModel.userLocation, userPath: $viewModel.pathCoordinates)

                if showTrackingView,
                   !viewModel.rideFinished,
                   !viewModel.rideStoredSuccessfully
                {
                    TrackingView(viewModel: $viewModel)
                }

                if viewModel.rideFinished
                {
                    FinishedRideView(viewModel: $viewModel)
                }

                if viewModel.rideStoredSuccessfully {
                    ProgressStoredView(rideStoredSuccessfully: $viewModel.rideStoredSuccessfully)
                }
            }
            .navigationTitle("Current Ride")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        //Show/hide start and stop tracking view
                        withAnimation {
                            showTrackingView.toggle()
                        }
                    }) {
                        Image(systemName: showTrackingView ? "xmark" : "plus")
                    }
                    .foregroundStyle(.white)
                }
            }
        }
    }
}
