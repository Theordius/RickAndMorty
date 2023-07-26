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
            ZStack {
                VStack(spacing: 0) {
                    Spacer()
                    NavigationBarView(title: "Episodes")
                        .padding(.horizontal, 15)
                        .padding(.bottom, 10)
                        .padding(
                            .top,
                            UIApplication.shared.windows.first?.safeAreaInsets.top)
                        .background(Color.white)
                        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 5)
                    Spacer()
                    
                    List(viewModel.episodes) { episode in
                        NavigationLink(destination: EpisodeDetailView(episode: episode)) {
                           // Text(episode.name)
                            EpisodeListRow(episodes: episode)
                        }
                    }
                }
                .onAppear {
                    viewModel.fetchEpisodes()
                }
            }
            .ignoresSafeArea(.all, edges: .top)
        }
    }
}

//MARK: - PREVIEW
struct EpisodesView_Previews: PreviewProvider {
    static var previews: some View {
        EpisodesView()
    }
}

