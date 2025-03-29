//
//  MainTabView.swift
//  XBike
//
//  Created by Frank Travieso on 29/03/2025.
//

import SwiftUI

struct MainTabView: View {
    init() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.orange
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance

        let tabAppearance = UITabBarAppearance()
        tabAppearance.backgroundColor = UIColor.white
        UITabBar.appearance().standardAppearance = tabAppearance
        UITabBar.appearance().scrollEdgeAppearance = tabAppearance
    }

    var body: some View {
        TabView {
            Text("Tab 1")
                .tabItem {
                    Image(systemName: "bicycle")
                    Text("Current Ride")
                }

            Text("Tab 2")
                .tabItem {
                    Image(systemName: "gauge")
                    Text("My Progress")
                }
        }
        .tint(.orange)
    }
}
