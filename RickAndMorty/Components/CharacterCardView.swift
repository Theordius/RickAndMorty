//
//  CardView.swift
//  RickAndMorty
//
//  Created by Rafał Gęsior on 24/07/2023.
//

import SwiftUI

struct CharacterCardView: View {
    //MARK: - PROPERTIES
    @StateObject var viewModel = ViewModel()
    let character: Character
    
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    let description = String(localized: "Some kind of character description if api had provided it..." )
    
    //MARK: - BODY
    var body: some View {
        //MARK: - CARD
        NavigationView {
            ZStack {
                CustomBackgroundView()
                VStack {
                    //MARK: - HEADER
                    VStack(alignment: .leading) {
                        Text(character.name)
                            .modifier(HeaderTextModifier())
                            .foregroundStyle(
                                LinearGradient(
                                    colors: [.customGrayLight, .customGrayMedium],
                                    startPoint: .top, endPoint: .bottom)
                            )
                        Divider().padding(.horizontal)
                        Text(description)
                            .modifier(DescriptionTextModifier())
                            .foregroundColor(.customGrayMedium)
                    } //: HEADER
                    .padding(.horizontal, 16)
                    
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
                                .frame(width: 240, height: 240)
                            ImageLoader(url: characterImageURL)
                                .scaledToFit()
                                .frame(width: 220, height: 220)
                                .clipShape(Circle())
                        }
                    } else {
                        Color.clear
                            .frame(width: 256, height: 256)
                            .overlay(Text("Loading Image...").foregroundColor(.white))
                    }
                    
                    Button {
                        haptics.impactOccurred()
                    } label: {
                        NavigationLink(destination: CharacterDetailView(character: character)) {
                            CustomButtonView()
                        }
                    }
                    .padding()
                }
            } //: CARD
            .frame(width: 320, height: 570)
            .onAppear {
                viewModel.fetchCharacters()
            }
        }
    }
}

//MARK: - PREVIEW
struct CharacterCardView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterCardView(character: SampleData.characterExample)
    }
}
