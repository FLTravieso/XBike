//
//  OnboardingViewModel.swift
//  XBike
//
//  Created by Frank Travieso on 28/03/2025.
//

class OnboardingViewModel {
    let steps: [OnboardingStep]

    init() {
        steps = [
            OnboardingStep(image: "onboarding_1", title: "Extremely simple to use", buttonTitle: nil),
            OnboardingStep(image: "onboarding_2", title: "Track your time and distance", buttonTitle: nil),
            OnboardingStep(image: "onboarding_3", title: "See your progress and challenge yourself!", buttonTitle: "Let's go")
        ]
    }
}
