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
        NavigationStack {
            VStack(spacing: 0) {
                if viewModel.episodesLoadingState == .loading {
                    CustomLoader()
                } else {
                    VStack(spacing: 0) {
                        NavigationBarView(title: "Episodes")
                            .modifier(NavigationBarStyleModifier())

                        List(viewModel.episodes) { episode in
                            NavigationLink(destination: EpisodeDetailView(episode: episode)) {
                                EpisodeListRow(episodes: episode)
                            }
                        }
                    }
                    .ignoresSafeArea(.all, edges: .top)
                }
            }
        }
        .accentColor(.yellow)
        .onAppear {
            // Data loading was delayed for testing purposes
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                viewModel.fetchEpisodes()
            }
        }
    }
}

//MARK: - PREVIEW
struct EpisodesView_Previews: PreviewProvider {
    static var previews: some View {
        EpisodesView()
            .environmentObject(LaunchScreenStateManager())
    }
}


