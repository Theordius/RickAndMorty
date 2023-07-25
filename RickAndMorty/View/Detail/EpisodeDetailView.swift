//
//  EpisodeDetailView.swift
//  RickAndMorty
//
//  Created by Rafał Gęsior on 24/07/2023.
//

import SwiftUI

struct EpisodeDetailView: View {
    var episode: Episode
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(episode.name)
                .font(.headline)
            Text("Air Date: ...")
            Text("Episode Code:...")
        }
        .padding()
    }
}

//MARK: - PREVIEW
struct EpisodeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        // Create a sample Episode object for preview
        let sampleData = Episode(id: 1, name: "Sample Episode", airDate: "January 1, 2023", episode: "S01E01", characters: [], url: URL(string: "https://rickandmortyapi.com/api/episode/1")!, created: "Jaunuary 1")

        EpisodeDetailView(episode: sampleData)
    }
}
