//
//  TrackingView.swift
//  XBike
//
//  Created by Frank Travieso on 29/03/2025.
//

import SwiftUI

struct TrackingView: View {
    @Binding var viewModel: CurrentRideViewModel

    var body: some View {
        VStack {
            Spacer()
            VStack {
                Spacer()

                timer

                HStack(alignment: .center) {
                    Spacer()

                    startButton

                    Spacer()

                    verticalSeparator

                    Spacer()

                    stopButton

                    Spacer()
                }
            }
            .frame(width: 350, height: 150)
            .background(.white)
            .clipShape(.rect(cornerRadius: 10))
            .shadow(radius: 10)
            .padding(20)
        }
    }

    @ViewBuilder private var timer: some View {
        Text(viewModel.formattedTime)
            .foregroundStyle(.black)
            .font(.largeTitle)
            .padding(.top, 16)
    }

    @ViewBuilder private var verticalSeparator: some View {
        VStack {
            Rectangle()
                .fill(.orange)
                .frame(width: 3)
                .padding(16)
        }
    }

    @ViewBuilder private var startButton: some View {
        Button("Start") {
            viewModel.startRide()
        }
        .foregroundStyle(viewModel.isRunning ? .gray: .orange)
        .font(.title2)
        .disabled(viewModel.isRunning)
    }

    @ViewBuilder private var stopButton: some View {
        Button("Stop") {
            viewModel.stopRide()
        }
        .foregroundStyle(viewModel.isRunning ? .orange: .gray)
        .font(.title2)
    }
}
