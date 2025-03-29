//
//  TrackingView.swift
//  XBike
//
//  Created by Frank Travieso on 29/03/2025.
//

import SwiftUI

struct TrackingView: View {
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
        Text("00 : 00 : 00")
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
            //Start tracking
        }
        .foregroundStyle(.orange)
        .font(.title2)
    }

    @ViewBuilder private var stopButton: some View {
        Button("Stop") {
            //Stop tracking
        }
        .foregroundStyle(.gray)
        .font(.title2)
    }
}
