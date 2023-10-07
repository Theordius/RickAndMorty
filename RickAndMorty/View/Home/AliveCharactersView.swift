//
//  AliveCharactersView.swift
//  RickAndMorty
//
//  Created by Rafał Gęsior on 24/07/2023.
//

/// View was created using TabView for showign purposes

import SwiftUI

struct AliveCharactersView: View {
    //MARK: - PROPERTIES
    @StateObject var viewModel = CharactersViewModel()

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
                        GeometryReader { geometry in
                            ZStack {
                                CustomLoader()
                                    .frame(width: geometry.size.width, height: geometry.size.height)
                            }
                        }
                    case .loaded:
                        TabView {
                            ForEach(viewModel.aliveCharacters) { character in
                                CharacterCardView(character: character)
                                    .padding(.vertical)
                                    .padding(.horizontal, 25)
                            }
                            Spacer()
                        }
                        .tabViewStyle(PageTabViewStyle())
                    default:
                        Text("An error occurred.")
                    }
                }
            }
            .ignoresSafeArea(.all, edges: .top)
        }
        .accentColor(.yellow)
        .onAppear {
            Task {
                // Delay of 1 second to simulate loading
                try await Task.sleep(nanoseconds: 1_000_000_000)
                await viewModel.fetchCharacters()
            }
        }
    }
}

//MARK: - PREVIEW
struct AliveCharactersView_Previews: PreviewProvider {
    static var previews: some View {
        AliveCharactersView()
            .environmentObject(LaunchScreenStateManager())
    }
}
