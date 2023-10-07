//
//  DeadCharactersView.swift
//  RickAndMorty
//
//  Created by Rafał Gęsior on 24/07/2023.
//

/// View was created using scroll view instead of tab view with ios 16 features

import SwiftUI

struct DeadCharactersView: View {
    //MARK: - PROPERTIES
    @StateObject var viewModel = CharactersViewModel()

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
                        GeometryReader { geometry in
                            ZStack {
                                CustomLoader()
                                    .frame(width: geometry.size.width, height: geometry.size.height)
                            }
                        }
                    case .loaded:
                        ScrollView(.horizontal, showsIndicators: false) {
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
                          //  .scrollTargetLayout()
                        }
//                        .scrollTargetBehavior(.viewAligned)
//                        .safeAreaPadding(.horizontal)

                    case .error(let error):
                        Text("Error loading data: \(error.localizedDescription)")
                    }
                }
            }
            .ignoresSafeArea(.all, edges: .top)
        }
        .accentColor(.yellow)
        .onAppear {
            Task {
                // Delay of 1 second to simulate loading (if you want to)
                try await Task.sleep(nanoseconds: NSEC_PER_SEC)
                await viewModel.fetchCharacters()
            }
        }
    }
}

//MARK: - PREVIEW
struct DeadCharactersView_Previews: PreviewProvider {
    static var previews: some View {
        DeadCharactersView()
            .environmentObject(LaunchScreenStateManager())
    }
}
