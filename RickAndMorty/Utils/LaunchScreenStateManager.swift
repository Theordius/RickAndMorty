//
//  LaunchScreenStateManager.swift
//  RickAndMorty
//
//  Created by Rafał Gęsior on 27/07/2023.
//

import Foundation

final class LaunchScreenStateManager: ObservableObject {
 @Published private(set) var state: LaunchScreenStep = .firstStep
    @MainActor func dismiss() {
        Task {
            state = .secondStep
            try? await Task.sleep(for: Duration.seconds(1))
            self.state = .finished
        }
    }
}
