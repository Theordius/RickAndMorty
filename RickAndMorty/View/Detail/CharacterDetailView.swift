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
        Text(character.name)
    }
}

//MARK: - PREVIEW
struct CharacterDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterDetailView(character: Character(id: 1, name: "Rick Sanchez", status: "Alive", species: "Human", gender: "Male", image: URL(string: "https://rickandmortyapi.com/api/character/avatar/1.jpeg")))
    }
}
