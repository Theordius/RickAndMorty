//
//  EpisodesViewModel.swift
//  RickAndMorty
//
//  Created by Rafał Gęsior on 25/07/2023.
//
/// I'am fully aware that the application takes data only from the first page of the API, didn't have enough time to figure it out in better way


import Foundation

@MainActor class EpisodesViewModel: ObservableObject {
    @Published private(set) var episodes = [Episode]()
    @Published var loadingState: LoadingState = .loading

    private let networkManager = NetworkManager()

    func fetchEpisodes() async {
        let api = "https://rickandmortyapi.com/api/episode"
        loadingState = .loading
        do {
            let results: Results<Episode> = try await networkManager.fetchData(from: api)
            self.episodes = results.results
            self.loadingState = .loaded
        } catch {
            print("Error fetching episodes: \(error)")
            self.loadingState = .error(.decodingError)
        }
    }

}
