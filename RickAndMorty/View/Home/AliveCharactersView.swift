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
                    NavigationBarView(title: String(localized: "Alive Characters"))
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
                        TabView {
                            ForEach(viewModel.aliveCharacters) { character in
                                CharacterCardView(character: character)
                                    .padding(.vertical)
                                    .padding(.horizontal, 25)
                            }
                        }
                        .tabViewStyle(PageTabViewStyle())
                    }
                }
            }
        }
        .ignoresSafeArea(.all, edges: .top)
        .onAppear {
            // Data loading was delayed for testing purposes
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                viewModel.fetchCharacters()
            }
        }
    }
}




//MARK: - PREVIEW
struct AliveCharactersView_Previews: PreviewProvider {
    static var previews: some View {
        AliveCharactersView()
    }
}
