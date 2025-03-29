//
//  CurrentRideTabView.swift
//  XBike
//
//  Created by Frank Travieso on 29/03/2025.
//

import SwiftUI

struct CurrentRideTabView:View {
    @State private var enableAddButton = true

    var body: some View {
        NavigationStack {
            ZStack {
                MapView()
            }
            .navigationTitle("Current Ride")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        //Show/hide start and stop tracking view
                        enableAddButton.toggle()
                    }) {
                        Image(systemName: enableAddButton ? "plus" : "xmark")
                    }
                    .foregroundStyle(.white)
                }
            }
        }
    }
}
