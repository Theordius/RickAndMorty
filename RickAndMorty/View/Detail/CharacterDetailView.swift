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
    let screenSize = UIScreen.main.bounds.size
    
    //MARK: - BODY
    var body: some View {
        VStack(alignment: .center, spacing: 16) {
            Spacer()
            Text(character.name.uppercased())
                .modifier(BoldTextModifier())
            
            Text("")
            
            ImageLoader(url: character.image!)
                .scaledToFit()
                .clipShape(Circle())
                .frame(width: 200, height: 200)
          
            VStack(alignment: .center, spacing: 8) {
                Text(character.status)
                Text(character.species)
                Text(character.gender)
            }
            .modifier(HeadlineTextModifier())
            .foregroundColor(.white)
            
            
            Spacer()
        }
        .background(
            Image("background")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: screenSize.width, height: screenSize.height)
        )
        .edgesIgnoringSafeArea(.all)
    }
}

//MARK: - PREVIEW
struct CharacterDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterDetailView(character: SampleData.characterExample)
    }
}
