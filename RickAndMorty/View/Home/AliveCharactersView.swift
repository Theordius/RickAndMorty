//
//  AliveCharactersView.swift
//  RickAndMorty
//
//  Created by Rafał Gęsior on 24/07/2023.
//

import SwiftUI

struct AliveCharactersView: View {
    //MARK: - PROPERTIES
    @StateObject var viewModel = ViewModel()
   
    var body: some View {
        NavigationStack {
            ZStack {
                CustomAdaptiveBackground()
                VStack {
                    NavigationBarView(title: "Dead Characters")
                        .modifier(NavigationBarStyleModifier())
                    Spacer()
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack(alignment: .center, spacing: 16) {
                            ForEach(viewModel.aliveCharacters) { character in
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
            .ignoresSafeArea(.all, edges: .top)
        }
        .accentColor(.yellow)
    }
  
}

//MARK: - PREVIEW
struct AliveCharactersView_Previews: PreviewProvider {
    static var previews: some View {
        AliveCharactersView()
    }
}
