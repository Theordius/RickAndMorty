//
//  DeadCharactersView.swift
//  RickAndMorty
//
//  Created by Rafał Gęsior on 24/07/2023.
//

import SwiftUI

struct DeadCharactersView: View {
    //MARK: - PROPERTIES
    @StateObject var viewModel = ViewModel()
    var characters: [Character]
    
    var body: some View {
        VStack {
            NavigationBarView(title: "Dead Characters")
                .padding(.horizontal, 15)
                .padding(.bottom, 10)
                .padding(.top,
                         UIApplication.shared.windows.first?.safeAreaInsets.top)
                .background(Color.white)
                .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 5)
            
            Spacer()
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(alignment: .center, spacing: 25) {
                    ForEach(viewModel.deadCharacters) { character in
                        CharacterCardView(character: character)
                    }
                }
                .padding(.vertical)
                .padding(.horizontal, 25)
                Spacer()
            }
            
            .onAppear {
                viewModel.fetchCharacters()
            }
        }
    }
  
}



//MARK: - PREVIEW
struct DeadCharactersView_Previews: PreviewProvider {
    static var previews: some View {
        DeadCharactersView(characters: [SampleData.characterExample, SampleData.characterExample, SampleData.characterExample])
    }
}
