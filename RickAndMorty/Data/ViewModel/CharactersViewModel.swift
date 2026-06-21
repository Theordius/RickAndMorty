//
//  CharactersViewModel.swift
//  RickAndMorty
//
//  Created by Rafał Gęsior on 07/10/2023.
//

import Foundation
import Observation

@MainActor
@Observable
final class CharactersViewModel {
    // MARK: - Properties
    private(set) var characters = [Character]()
    var loadingState: LoadingState = .loading
    private let networkManager: DataManagable

    // MARK: - Init
    init(networkManager: DataManagable = NetworkManager()) {
        self.networkManager = networkManager
    }

    var aliveCharacters: [Character] {
        characters.filter { $0.status == "Alive" || $0.status == "unknown" }
    }

    var deadCharacters: [Character] {
        characters.filter { $0.status == "Dead" }
    }

    // MARK: - Functions
    func fetchCharacters() async {
        let api = "https://rickandmortyapi.com/api/character?page=1"
        loadingState = .loading
        do {
            let results: Results<Character> = try await networkManager.fetchData(from: api)
            characters = results.results
            loadingState = .loaded
        } catch {
            print("Error fetching characters: \(error)")
            loadingState = .error(.decodingError)
        }
    }
}
