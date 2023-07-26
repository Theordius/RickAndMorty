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
        ZStack {
            CustomAdaptiveBackground()
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
  
}

//MARK: - PREVIEW
struct AliveCharactersView_Previews: PreviewProvider {
    static var previews: some View {
        AliveCharactersView()
    }
}
