//
//  CardView.swift
//  RickAndMorty
//
//  Created by Rafał Gęsior on 24/07/2023.
//

import SwiftUI

import SwiftUI

struct CharacterCardView: View {
    //MARK: - PROPERTIES
    @StateObject var viewModel = ViewModel()
    let description = String(localized: "Some kind of character description if api has provide it..." )
    
    //MARK: - BODY
    var body: some View {
        //MARK: - CARD
        ZStack {
            CustomBackgroundView()
            VStack {
                //MARK: - HEADER
                VStack(alignment: .leading) {
                    if let characterName = viewModel.characters.first?.name {
                        Text(characterName)
                            .modifier(HeaderTextModifier())
                            .foregroundStyle(
                                LinearGradient(
                                    colors: [.customGrayLight, .customGrayMedium],
                                    startPoint: .top, endPoint: .bottom)
                            )
                    } else {
                        Text("Loading...")
                            .modifier(HeaderTextModifier())
                            .foregroundStyle(
                                LinearGradient(
                                    colors: [.customGrayLight, .customGrayMedium],
                                    startPoint: .top, endPoint: .bottom)
                            )
                    }
                    
                    Divider().padding(.horizontal)
                    Text(description)
                        .modifier(DescriptionTextModifier())
                        .foregroundColor(.customGrayMedium)
                } //: HEADER
                .padding(.horizontal, 30)
                
                //MARK: - MAIN CONTENT
                if let characterImageURL = viewModel.characters.first?.image {
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
                            .frame(width: 256, height: 256)
                        ImageLoader(url: characterImageURL)
                            .scaledToFit()
                            .frame(width: 240, height: 240)
                            .clipShape(Circle())
                    }
                } else {
                    Color.clear
                        .frame(width: 256, height: 256)
                        .overlay(Text("Loading Image...").foregroundColor(.white))
                }
              
                Button {
                    // ACTION: Show a Sheet
                } label: {
                    CustomButtonView()
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

