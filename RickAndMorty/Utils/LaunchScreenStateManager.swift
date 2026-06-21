//
//  LaunchScreenStateManager.swift
//  RickAndMorty
//
//  Created by Rafał Gęsior on 27/07/2023.
//

import Observation

@MainActor
@Observable
final class LaunchScreenStateManager {
    // MARK: - Properties
    private(set) var state: LaunchScreenStep = .firstStep

    // MARK: - Functions
    func dismiss() {
        Task {
            state = .secondStep
            try? await Task.sleep(for: .seconds(1))
            state = .finished
        }
    }
}
