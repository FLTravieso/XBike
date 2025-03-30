//
//  ProgressStoredView.swift
//  XBike
//
//  Created by Frank Travieso on 30/03/2025.
//

import SwiftUI

struct ProgressStoredView: View {
    var body: some View {
        VStack {
            Spacer()

            VStack {
                Text("Your progress has been correctly stored!")
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .padding(40)

                Button("OK") {
                    
                }
                .font(.title2)
                .foregroundStyle(.gray)
                .padding(20)
            }
            .frame(width: 350, height: 310)
            .background(.white)
            .clipShape(.rect(cornerRadius: 10))
            .shadow(radius: 10)
            .padding(20)

            Spacer()
        }
    }
}
