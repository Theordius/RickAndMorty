//
//  AppView.swift
//  RickAndMorty
//
//  Created by Rafał Gęsior on 24/07/2023.
//

import SwiftUI

struct AppView: View {
    // MARK: - PROPERTIES
    @EnvironmentObject private var launchScreenState: LaunchScreenStateManager

    // MARK: - BODY
    var body: some View {
        TabView {
            Tab(String(localized: "About"), systemImage: "house.fill") {
                ContentView()
            }

            Tab(String(localized: "Episodes"), systemImage: "list.star") {
                EpisodesView()
            }

            Tab(String(localized: "Alive"), systemImage: "heart.fill") {
                AliveCharactersView()
            }

            Tab(String(localized: "Dead"), systemImage: "heart.slash.fill") {
                DeadCharactersView()
            }
        }
        .tint(.yellow)
        .background(.ultraThinMaterial)
        .task {
            try? await Task.sleep(for: .seconds(1))
            launchScreenState.dismiss()
        }
    }
}

// MARK: - PREVIEW
#Preview {
    AppView()
        .environmentObject(LaunchScreenStateManager())
}
