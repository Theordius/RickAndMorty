//
//  AliveCharactersView.swift
//  RickAndMorty
//
//  Created by Rafał Gęsior on 24/07/2023.
//

/// View was created using a paged TabView for showing purposes

import SwiftUI

struct AliveCharactersView: View {
    //MARK: - Properties
    @State private var viewModel = CharactersViewModel()

    // MARK: - Body
    var body: some View {
        NavigationStack {
            ZStack {
                CustomAdaptiveBackground()
                VStack {
                    NavigationBarView(title: String(localized: "Alive Characters"))
                        .modifier(NavigationBarStyleModifier())
                    Spacer()

                    switch viewModel.loadingState {
                    case .loading:
                        CustomLoader()
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                    case .loaded:
                        TabView {
                            ForEach(viewModel.aliveCharacters) { character in
                                CharacterCardView(character: character)
                                    .padding(.vertical)
                                    .padding(.horizontal, 25)
                            }
                        
                        }
                        .tabViewStyle(.page)
                    default:
                        Text("An error occurred.")
                    }
                }
            }
            .ignoresSafeArea(.all, edges: .top)
        }
        .tint(.yellow)
        .onAppear {
            Task {
                // Delay of 1 second to simulate loading
                try await Task.sleep(for: .seconds(1))
                await viewModel.fetchCharacters()
            }
        }
    }
}

//MARK: - PREVIEW
#Preview {
    AliveCharactersView()
}
