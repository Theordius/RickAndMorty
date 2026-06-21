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

    // MARK: - Body
    var body: some Scene {
        WindowGroup {
            ZStack {
                AppView()
                if launchScreenState.state != .finished {
                    CustomLaunchScreen()
                }
            }
            .environment(launchScreenState)
        }
    }
}
