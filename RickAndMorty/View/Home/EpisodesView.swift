//
//  EpisodesView.swift
//  RickAndMorty
//
//  Created by Rafał Gęsior on 24/07/2023.
//

import SwiftUI

struct EpisodesView: View {
    @ObservedObject var networkManager = NetworkManager()
    let api: String = "https://rickandmortyapi.com/api/episode"

    var body: some View {
        NavigationView {
            List(networkManager.episodes) { episode in
                NavigationLink(destination: EpisodeDetailView(episode: episode)) {
                    Text(episode.name)
                }
            }
            .navigationTitle("Episodes")
        }
        .onAppear {
            networkManager.fetchData(from: api) { result in
                switch result {
                case .success(let results):
                    DispatchQueue.main.async {
                        self.networkManager.episodes = results.results
                    }
                case .failure(let error):
                    print("Error fetching episodes: \(error)")
                }
            }
        }
    }
}

//MARK: - PREVIEW
struct EpisodesView_Previews: PreviewProvider {
    static var previews: some View {
        EpisodesView()
    }
}





