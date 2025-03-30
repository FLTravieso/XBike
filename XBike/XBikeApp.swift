//
//  XBikeApp.swift
//  XBike
//
//  Created by Frank Travieso on 28/03/2025.
//

import SwiftUI
import SwiftData
import GoogleMaps

@main
struct XBikeApp: App {
    @StateObject private var appSettings = AppSettings()
    
    init() {
        // Usually would create a config file that is not persisted in the repo or cloud
        // but i will let the API key here just for this challenge convenience
        GMSServices.provideAPIKey("AIzaSyBv6wRDQKlJyHPWpuAGi5_-_IFl_oPRhvA")
    }

    var body: some Scene {
        WindowGroup {
            if appSettings.shouldShowOnboarding
            {
                OnboardingView(viewModel: OnboardingViewModel())
                    .environmentObject(appSettings)
            }
            else
            {
                MainTabView(createCurrentRideTabView: CurrentRideTabFactory())
            }
        }
    }
}
