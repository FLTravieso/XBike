//
//  XBikeApp.swift
//  XBike
//
//  Created by Frank Travieso on 28/03/2025.
//

import SwiftUI
import SwiftData

@main
struct XBikeApp: App {
    var body: some Scene {
        WindowGroup {
            OnboardingView(viewModel: OnboardingViewModel())
        }
    }
}
