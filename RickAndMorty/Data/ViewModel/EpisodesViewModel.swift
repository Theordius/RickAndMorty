//
//  EpisodesViewModel.swift
//  RickAndMorty
//
//  Created by Rafał Gęsior on 25/07/2023.
//
/// The application currently loads only the first page of the API.

import Foundation
import Observation

@MainActor
@Observable
final class EpisodesViewModel {
    // MARK: - Properties
    private(set) var episodes = [Episode]()
    var loadingState: LoadingState = .loading
    private let networkManager: DataManagable

    // MARK: - Init
    init(networkManager: DataManagable = NetworkManager()) {
        self.networkManager = networkManager
    }

    // MARK: - Functions
    func fetchEpisodes() async {
        let api = "https://rickandmortyapi.com/api/episode"
        loadingState = .loading
        do {
            let results: Results<Episode> = try await networkManager.fetchData(from: api)
            episodes = results.results
            loadingState = .loaded
        } catch {
            print("Error fetching episodes: \(error)")
            loadingState = .error(.decodingError)
        }
    }
}
