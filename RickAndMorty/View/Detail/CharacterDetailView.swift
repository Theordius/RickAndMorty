//
//  CharacterDetailView.swift
//  RickAndMorty
//
//  Created by Rafał Gęsior on 25/07/2023.
//

import SwiftUI

struct CharacterDetailView: View {
    //MARK: - PROPERTIES
    var character: Character

    //MARK: - BODY
    var body: some View {
        ZStack {
            CustomAdaptiveBackground()
            VStack(alignment: .center, spacing: 16) {
                Spacer()
                Text(character.name.uppercased())
                    .modifier(BoldTextModifier())

                Text("")

                ImageLoader(url: character.image ?? Character.randomImage)
                    .scaledToFit()
                    .clipShape(.circle)
                    .frame(width: 200, height: 200)

                VStack(alignment: .center, spacing: 8) {
                    CharacterDetailGrid(status: character.status,
                                        gender: character.gender,
                                        species: character.species)
                }
                .modifier(HeadlineTextModifier())
                .foregroundStyle(.white)

                Spacer()
            }
        }
    }
}

//MARK: - PREVIEW
#Preview {
    CharacterDetailView(character: Character.characterExample)
}
