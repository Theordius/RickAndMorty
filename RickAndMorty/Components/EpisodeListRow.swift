//
//  EpisodeListItemView.swift
//  RickAndMorty
//
//  Created by Rafał Gęsior on 24/07/2023.
//

import SwiftUI

struct EpisodeListRow: View {
    //MARK: - PROPERTIES
    let episodes: Episode
    
    //MARK: - BODY
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            Image(systemName: "folder.circle")
                .resizable()
                .scaledToFit()
                .frame(width: 24, height: 24)
                .clipShape(
                    RoundedRectangle(cornerRadius: 12)
                )
            
            Text(episodes.name)
                .font(.title2)
                .fontWeight(.heavy)
                .foregroundColor(.accentColor)
        } //: VSTACK
    } //: HSTACK
     
}

//MARK: - PREVIEW
struct EpisodeListRow_Previews: PreviewProvider {
    static var previews: some View {
        EpisodeListRow(episodes: SampleData.episodeExample)
            .previewLayout(.sizeThatFits)
    }
}
