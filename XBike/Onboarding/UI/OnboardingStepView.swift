//
//  OnboardingStepView.swift
//  XBike
//
//  Created by Frank Travieso on 28/03/2025.
//

import SwiftUI

struct OnboardingStepView: View {
    @EnvironmentObject var appSettings: AppSettings
    let step: OnboardingStep

    var body: some View {
        VStack {
            Spacer()

            Image(step.image)
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .padding(20)

            Text(step.title)
                .foregroundStyle(.white)
                .font(.title)
                .multilineTextAlignment(.center)
                .padding(20)

            Spacer()

            Button(step.buttonTitle ?? "") {
                appSettings.shouldShowOnboarding = false
            }
            .padding(20)
            .foregroundStyle(.white)
            .background(.blue)
            .clipShape(.rect(cornerRadius: 10))
            .opacity(step.buttonTitle != nil ? 1 : 0)
            .padding(30)
        }
        .padding(20)
    }
}
