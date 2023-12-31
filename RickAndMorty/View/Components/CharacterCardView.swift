//
//  CharacterCardView.swift
//  RickAndMorty
//
//  Created by Rafał Gęsior on 24/07/2023.
//

import SwiftUI

struct CharacterCardView: View {
    //MARK: - PROPERTIES
    @StateObject var viewModel = CharactersViewModel()
    let character: Character
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    let description = String(localized: "Brief character description if it was provided by API")
    
    //MARK: - BODY
    var body: some View {
        //MARK: - CARD
        ZStack {
            CharacterCardBackground()
            VStack {
                //MARK: - HEADER
                VStack(alignment: .center) {
                    Text(character.name)
                        .modifier(GradientTextModifier())
                        .modifier(HeaderTextModifier())
                    Divider().padding(.horizontal, 4)
                    Text(description)
                        .modifier(DescriptionTextModifier())
                        .foregroundColor(.customGrayMedium)
                } //: HEADER
                .padding(.horizontal, 8)
                
                //MARK: - MAIN CONTENT
                if let characterImageURL = character.image {
                    
                    ZStack {
                        Circle()
                            .fill(
                                LinearGradient(colors: [
                                    Color.customIndigoMedium,
                                    Color.customSalmonLight
                                ],
                                               startPoint: .topLeading,
                                               endPoint: .bottomTrailing
                                              )
                            )
                            .frame(maxWidth: 180, maxHeight: 180)
                        ImageLoader(url: characterImageURL)
                            .scaledToFit()
                            .clipShape(Circle())
                            .frame(maxWidth: 170, maxHeight: 170)
                    }
                    Divider().padding(.horizontal,4)
                    VStack {
                        CharacterStatusBar(character: character)
                        Button {
                            haptics.impactOccurred()
                            
                        } label: {
                            NavigationLink(destination: CharacterDetailView(character: character)) {
                                CustomButtonView()
                            }
                        }
                    }
                    .padding()
                }
            }
        } //: CARD
        .frame(idealWidth: 320, maxWidth: 320, idealHeight: 520, maxHeight: 520)
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
struct CharacterCardView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterCardView(character: Character.characterExample)
    }
}
