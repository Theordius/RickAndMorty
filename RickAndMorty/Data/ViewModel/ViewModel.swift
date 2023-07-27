//
//  EpisodesViewModel.swift
//  RickAndMorty
//
//  Created by Rafał Gęsior on 25/07/2023.
//
/// I'am fully aware that the application takes data only from the first page of the API, didn't have enough time to figure it out in better way

import SwiftUI

enum LoadingState {
    case loading
    case loaded
    case error
}

@MainActor class ViewModel: ObservableObject {
    @Published private(set) var episodes = [Episode]()
    @Published private(set) var characters = [Character]()
    @Published private(set) var episodesLoadingState: LoadingState = .loading
    @Published private(set) var charactersLoadingState: LoadingState = .loading
    
    lazy var errorAlert: UIAlertController = {
        let alert = UIAlertController(title: "", message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        return alert
    }()
    
    var aliveCharacters: [Character] {
        characters.filter { $0.status == "Alive" || $0.status == "unknown" }
    }
    
    var deadCharacters: [Character] {
        characters.filter { $0.status == "Dead" }
    }
    
    private let networkManager = NetworkManager()
    
    func fetchEpisodes() {
           let api = "https://rickandmortyapi.com/api/episode"
           episodesLoadingState = .loading
           networkManager.fetchData(from: api) { (result: Result<Results<Episode>, NetworkError>) in
               switch result {
               case .success(let results):
                   DispatchQueue.main.async {
                       self.episodes = results.results
                       self.episodesLoadingState = .loaded
                   }
               case .failure(let error):
                   print("Error fetching episodes: \(error)")
                   DispatchQueue.main.async {
                       self.episodesLoadingState = .error
                   }
               }
           }
       }

       func fetchCharacters() {
           let api = "https://rickandmortyapi.com/api/character?page=1"
           charactersLoadingState = .loading
           networkManager.fetchData(from: api) { (result: Result<Results<Character>, NetworkError>) in
               switch result {
               case .success(let results):
                   DispatchQueue.main.async {
                       self.characters = results.results
                       self.charactersLoadingState = .loaded
                   }
               case .failure(let error):
                   print("Error fetching characters: \(error)")
                   DispatchQueue.main.async {
                       self.charactersLoadingState = .error
                   }
               }
           }
       }
   }
