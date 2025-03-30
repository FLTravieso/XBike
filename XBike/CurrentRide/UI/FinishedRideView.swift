//
//  FinishedRideView.swift
//  XBike
//
//  Created by Frank Travieso on 30/03/2025.
//

import SwiftUI

struct FinishedRideView: View {
    @Binding var viewModel: CurrentRideViewModel

    var body: some View {
        VStack {
            Spacer()

            VStack {
                Spacer()

                finalTime

                Spacer()

                finalDistance

                HStack(alignment: .center) {
                    Spacer()

                    storeButton

                    Spacer()

                    verticalSeparator

                    Spacer()

                    deleteButton

                    Spacer()
                }
            }
            .frame(width: 350, height: 310)
            .background(.white)
            .clipShape(.rect(cornerRadius: 10))
            .shadow(radius: 10)
            .padding(20)

            Spacer()
        }
    }

    @ViewBuilder private var finalTime: some View {
        Text("Your time was")
            .foregroundStyle(.black)
            .font(.title)
            .padding(.top, 16)

        Text(viewModel.formattedTime)
            .foregroundStyle(.black)
            .font(.largeTitle)
            .padding(.top, 2)
    }

    @ViewBuilder private var finalDistance: some View {
        Text("Distance")
            .foregroundStyle(.black)
            .font(.title)
            .padding(.top, 2)

        Text(viewModel.formattedDistance)
            .foregroundStyle(.black)
            .font(.largeTitle)
            .padding(.top, 2)
    }

    @ViewBuilder private var verticalSeparator: some View {
        VStack {
            Rectangle()
                .fill(.orange)
                .frame(width: 3)
                .padding(16)
        }
    }

    @ViewBuilder private var storeButton: some View {
        Button("Store") {
            // Store ride
        }
        .foregroundStyle(.orange)
        .font(.title2)
    }

    @ViewBuilder private var deleteButton: some View {
        Button("Delete") {
            // Reset ride
        }
        .foregroundStyle(.gray)
        .font(.title2)
    }
}
