//
//  EpisodeListItemView.swift
//  RickAndMorty
//
//  Created by Rafał Gęsior on 24/07/2023.
//

import SwiftUI

struct EpisodeListItemView: View {
    //MARK: - PROPERTIES
    let episodes: NetworkManager?
    
    //MARK: - BODY
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            Image(systemName: "xmark")
                .resizable()
                .scaledToFill()
                .frame(width: 48, height: 48)
                .clipShape(
                RoundedRectangle(cornerRadius: 12)
                )
            
            VStack(alignment: .leading, spacing: 8) {
                Text("Example text")
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(.accentColor)
                
                Text("Example text to be displayed on the row")
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                    .padding(.trailing, 8)
            } //: VSTACK
        } //: HSTACK
    }
}

//MARK: - PREVIEW
struct EpisodeListItemView_Previews: PreviewProvider {
    static var previews: some View {
        EpisodeListItemView(episodes: NetworkManager())
    }
}
