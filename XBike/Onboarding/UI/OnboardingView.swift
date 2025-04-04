//
//  OnboardingView.swift
//  XBike
//
//  Created by Frank Travieso on 28/03/2025.
//

import SwiftUI

struct OnboardingView: View {
    let viewModel: OnboardingViewModel

    var body: some View {
        TabView() {
            ForEach(viewModel.steps, id: \.self) { step in
                OnboardingStepView(step: step)
            }
        }
        .tabViewStyle(.page)
        .background(.orange)
    }
}

#Preview {
    OnboardingView(viewModel: OnboardingViewModel())
}
