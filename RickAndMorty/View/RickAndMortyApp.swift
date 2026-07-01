//
//  RickAndMortyApp.swift
//  RickAndMorty
//
//  Created by Rafał Gęsior on 24/07/2023.
//

import SwiftUI

@main
struct RickAndMortyApp: App {
    // MARK: - Properties
    @State private var launchScreenState = LaunchScreenStateManager()
    @State private var charactersViewModel = CharactersViewModel()

    // MARK: - Body
    var body: some Scene {
        WindowGroup {
            ZStack {
                // Persistent backdrop so the crossfade to AppView never
                // flashes the window's default background.
                CustomAdaptiveBackground()

                // Keep the TabView out of the hierarchy until the launch
                // animation finishes. It's inserted with no animation
                // transaction so the Liquid Glass tab bar appears already
                // laid out at full width instead of expanding from a pill.
                if launchScreenState.state == .finished {
                    AppView()
                } else {
                    CustomLaunchScreen()
                }
            }
            .environment(launchScreenState)
            .environment(charactersViewModel)
            .task {
                try? await Task.sleep(for: .seconds(1))
                launchScreenState.dismiss()
            }
            .task {
                // Prefetch during the splash so the tabs are ready on reveal.
                await charactersViewModel.fetchCharacters()
            }
        }
    }
}
