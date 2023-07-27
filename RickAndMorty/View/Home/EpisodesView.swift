//
//  EpisodesView.swift
//  RickAndMorty
//
//  Created by Rafał Gęsior on 24/07/2023.
//

import SwiftUI

struct EpisodesView: View {
    @StateObject var viewModel = ViewModel()
    lazy var errorAlert: UIAlertController = {
        let alert = UIAlertController(title: "", message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        return alert
    }()
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                Spacer()
                NavigationBarView(title: "Episodes")
                    .modifier(NavigationBarStyleModifier())
                Spacer()
                
                List(viewModel.episodes) { episode in
                    NavigationLink(destination: EpisodeDetailView(episode: episode)) {
                        EpisodeListRow(episodes: episode)
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

