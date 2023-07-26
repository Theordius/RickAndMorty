//
//  EpisodeDetailView.swift
//  RickAndMorty
//
//  Created by Rafał Gęsior on 24/07/2023.
//

import SwiftUI

import SwiftUI

struct EpisodeDetailView: View {
    //MARK: - PROPERTIES
    var episode: Episode
    let screenSize = UIScreen.main.bounds.size
    let summary: String = String(localized: "Some kind of summary of the episode if provided by API")
    
    //MARK: - BODY
    var body: some View {
        ZStack {
            CustomAdaptiveBackground()
            VStack(alignment: .center, spacing: 16) {
                Spacer()
                Image(systemName: "questionmark.app")
                   .font(Font.title.weight(.bold))
                    .font(.system(.caption2))
                    .foregroundColor(.white)
                    .imageScale(.large)
                
                Text(episode.name.uppercased())
                    .modifier(BoldTextModifier())
                
                Text(summary)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                
                VStack(alignment: .center, spacing: 8) {
                    Text("Air Date: \(episode.airDate)")
                    Divider().padding(.horizontal, 6)
                    Text("Episode Code: \(episode.episode)")
                   
                }
                .modifier(HeadlineTextModifier())
                .foregroundColor(.white)
                
                
                Spacer()
            }
          
        }
    }
}

//MARK: - PREVIEW
struct EpisodeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        EpisodeDetailView(episode: SampleData.episodeExample)
    }
}

