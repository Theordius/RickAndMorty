//
//  CharactersViewModel.swift
//  RickAndMorty
//
//  Created by Rafał Gęsior on 07/10/2023.
//

import Foundation

@MainActor class CharactersViewModel: ObservableObject {
    @Published private(set) var characters = [Character]()
    @Published var loadingState: LoadingState = .loading
    private let networkManager: DataManagable

    init(networkManager: DataManagable = NetworkManager()) {
           self.networkManager = networkManager
       }

    var aliveCharacters: [Character] {
        characters.filter { $0.status == "Alive" || $0.status == "unknown" }
    }

    var deadCharacters: [Character] {
        characters.filter { $0.status == "Dead" }
    }

    func fetchCharacters() async {
        let api = "https://rickandmortyapi.com/api/character?page=1"
        loadingState = .loading
        do {
            let results: Results<Character> = try await networkManager.fetchData(from: api)
            self.characters = results.results
            self.loadingState = .loaded
        } catch {
            print("Error fetching characters: \(error)")
            self.loadingState = .error(.decodingError)
        }
    }
}
