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
    
    //MARK: - BODY
    var body: some View {
        ZStack {
            CustomAdaptiveBackground()
            VStack(alignment: .center, spacing: 16) {
                Spacer()
                Text(episode.name.uppercased())
                    .modifier(BoldTextModifier())
                
                Text("Some kind of summary of the episode if provided by API")
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                
                VStack(alignment: .center, spacing: 8) {
                    Text("Date Created: \(episode.created)")
                    Text("Air Date: \(episode.airDate)")
                    Divider().padding(.horizontal, 6)
                    Text("Episode Code: \(episode.episode)")
                   
                }
                .modifier(HeadlineTextModifier())
                .foregroundColor(.white)
                
                
                Spacer()
            }
          
        }
//        .background(
//            Image("background")
//                .resizable()
//                .aspectRatio(contentMode: .fill)
//                .frame(width: screenSize.width, height: screenSize.height)
//        )
//        .ignoresSafeArea(.all, edges: .all)
    }
}

//MARK: - PREVIEW
struct EpisodeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        EpisodeDetailView(episode: SampleData.episodeExample)
    }
}

