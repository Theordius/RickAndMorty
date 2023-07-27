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
   
    var body: some View {
        NavigationStack {
            ZStack {
                CustomAdaptiveBackground()
                VStack {
                    NavigationBarView(title: String(localized: "Dead Characters"))
                        .modifier(NavigationBarStyleModifier())
                    Spacer()
                    
                    if viewModel.charactersLoadingState == .loading {
                        GeometryReader { geometry in
                            ZStack {
                                CustomLoader()
                                    .frame(width: geometry.size.width, height: geometry.size.height)
                            }
                        }
                    } else {
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
                    }
                }
            }
            .ignoresSafeArea(.all, edges: .top)
        }
        .accentColor(.yellow)
        .onAppear {
            // Data loading was delayed for testing purposes
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                viewModel.fetchCharacters()
            }
        }
    }
}



//MARK: - PREVIEW
struct DeadCharactersView_Previews: PreviewProvider {
    static var previews: some View {
        DeadCharactersView()
    }
}
