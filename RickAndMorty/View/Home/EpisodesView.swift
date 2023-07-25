//
//  EpisodesView.swift
//  RickAndMorty
//
//  Created by Rafał Gęsior on 24/07/2023.
//

import SwiftUI

struct EpisodesView: View {
    @StateObject var viewModel = ViewModel()
  
    var body: some View {
        NavigationView {
            List(viewModel.episodes) { episode in
                NavigationLink(destination: EpisodeDetailView(episode: episode)) {
                    Text(episode.name)
                }
            }
            .navigationTitle("Episodes")
        }
        .onAppear {
            viewModel.fetchEpisodes()
        }
    }
}

//MARK: - PREVIEW
struct EpisodesView_Previews: PreviewProvider {
    static var previews: some View {
        EpisodesView()
    }
}





