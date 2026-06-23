//
//  DeadCharactersView.swift
//  RickAndMorty
//
//  Created by Rafał Gęsior on 24/07/2023.
//

/// View was created using scroll view instead of tab view with ios 16 features

import SwiftUI

struct DeadCharactersView: View {
    //MARK: - Properties
    @State private var viewModel = CharactersViewModel()

    // MARK: - Body
    var body: some View {
        NavigationStack {
            ZStack {
                CustomAdaptiveBackground()
                VStack {
                    NavigationBarView(title: String(localized: "Dead Characters"))
                        .modifier(NavigationBarStyleModifier())

                    Spacer()

                    switch viewModel.loadingState {
                    case .loading:
                        CustomLoader()
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                    case .loaded:
                        ScrollView(.horizontal) {
                            LazyHStack {
                                ForEach(viewModel.deadCharacters) { character in
                                    CharacterCardView(character: character)
                                        .padding(.vertical)
                                        .padding(.horizontal, 25)
                                }
                                .scrollTransition { content, phase in
                                    content
                                        .opacity(phase.isIdentity ? 1 : 0)
                                        .scaleEffect(phase.isIdentity ? 1 : 0.75)
                                        .blur(radius: phase.isIdentity ? 0 : 10)
                                        
                                }
                            }
                            .scrollTargetLayout()
                        }
                        .scrollTargetBehavior(.viewAligned)
                        .scrollIndicators(.hidden)
                        .safeAreaPadding(.horizontal)

                    case .error(let error):
                        Text("Error loading data: \(error.localizedDescription)")
                    }
                }
            }
            .ignoresSafeArea(.all, edges: .top)
        }
        .tint(.yellow)
        .onAppear {
            Task {
                // Delay of 1 second to simulate loading (if you want to)
                try await Task.sleep(for: .seconds(1))
                await viewModel.fetchCharacters()
            }
        }
    }
}

//MARK: - Preview
#Preview {
    DeadCharactersView()
}
