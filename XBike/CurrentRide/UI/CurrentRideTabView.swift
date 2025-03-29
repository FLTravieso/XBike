//
//  CurrentRideTabView.swift
//  XBike
//
//  Created by Frank Travieso on 29/03/2025.
//

import SwiftUI

struct CurrentRideTabView:View {
    @State private var showTrackingView = false

    var body: some View {
        NavigationStack {
            ZStack {
                MapView()

                if showTrackingView {
                    TrackingView()
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
