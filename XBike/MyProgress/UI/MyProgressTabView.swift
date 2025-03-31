//
//  MyProgressTabView.swift
//  XBike
//
//  Created by Frank Travieso on 30/03/2025.
//

import SwiftUI

struct MyProgressTabView: View {
    @State var viewModel: MyProgressViewModel

    init(viewModel: MyProgressViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        NavigationStack {
            VStack {
                ForEach(viewModel.rides) { ride in
                    RideListItemView(rideItem: ride)
                }
            }
            .navigationTitle("My Progress")
            .navigationBarTitleDisplayMode(.inline)

            Spacer()
        }
        .onAppear {
            viewModel.onAppear()
        }
    }
}
