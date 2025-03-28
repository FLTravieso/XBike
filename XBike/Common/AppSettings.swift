//
//  AppSettings.swift
//  XBike
//
//  Created by Frank Travieso on 28/03/2025.
//

import SwiftUI

class AppSettings: ObservableObject {
    @AppStorage("shouldShowOnboarding") var shouldShowOnboarding: Bool = true
}
