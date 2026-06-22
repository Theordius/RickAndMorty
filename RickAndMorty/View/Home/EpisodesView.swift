//
//  EpisodesView.swift
//  RickAndMorty
//
//  Created by Rafał Gęsior on 24/07/2023.
//

import SwiftUI

struct EpisodesView: View {
    // MARK: - Properties
    @State private var viewModel = EpisodesViewModel()

    // MARK: - Body
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                if viewModel.loadingState == .loading {
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
        .tint(.yellow)
        .onAppear {
            Task {
                // Delay of 1 second to simulate loading (if you want to)
                try await Task.sleep(for: .seconds(1))
                await viewModel.fetchEpisodes()
            }
        }

    }
}

//MARK: - Preview
#Preview {
    EpisodesView()
}


