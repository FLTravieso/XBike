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
    @StateObject private var appSettings = AppSettings()

    var body: some Scene {
        WindowGroup {
            if appSettings.shouldShowOnboarding
            {
                OnboardingView(viewModel: OnboardingViewModel())
                    .environmentObject(appSettings)
            }
            else
            {
                MainTabView()
            }
        }
    }
}
