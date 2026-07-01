//
//  AliveCharactersView.swift
//  RickAndMorty
//
//  Created by Rafał Gęsior on 24/07/2023.
//

/// Uses the same horizontal ScrollView carousel as DeadCharactersView for a consistent card-switch animation.

import SwiftUI

struct AliveCharactersView: View {
    //MARK: - Properties
    @Environment(CharactersViewModel.self) private var viewModel

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
                        ScrollView(.horizontal) {
                            LazyHStack {
                                ForEach(viewModel.aliveCharacters) { character in
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
                    default:
                        Text("An error occurred.")
                    }
                }
            }
            .ignoresSafeArea(.all, edges: .top)
        }
        .tint(.yellow)
    }
}

//MARK: - PREVIEW
#Preview {
    AliveCharactersView()
        .environment(CharactersViewModel())
}
