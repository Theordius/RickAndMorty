//
//  CharacterCardView.swift
//  RickAndMorty
//
//  Created by Rafał Gęsior on 24/07/2023.
//

import SwiftUI

struct CharacterCardView: View {
    //MARK: - Properties
    let character: Character
    let description = String(localized: "Brief character description if it was provided by API")
    @State private var detailTapCount = 0

    //MARK: - Body
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
                        .foregroundStyle(Color.customGrayMedium)
                } //: HEADER
                .padding(.horizontal, 8)

                //MARK: - MAIN CONTENT
                if let characterImageURL = character.image {
                    ZStack {
                        Circle()
                            .fill(
                                LinearGradient(
                                    colors: [
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
                            .clipShape(.circle)
                            .frame(maxWidth: 170, maxHeight: 170)
                    }
                    Divider().padding(.horizontal,4)
                    VStack {
                        CharacterStatusBar(character: character)
                        NavigationLink {
                            CharacterDetailView(character: character)
                        } label: {
                            CustomButtonView()
                        }
                        .buttonStyle(.plain)
                        .simultaneousGesture(TapGesture().onEnded { detailTapCount += 1 })
                        .sensoryFeedback(.impact, trigger: detailTapCount)
                    }
                    .padding()
                }
            }
        } //: CARD
        .frame(idealWidth: 320, maxWidth: 320, idealHeight: 520, maxHeight: 520)
    }
}

//MARK: - Preview
#Preview {
    CharacterCardView(character: Character.characterExample)
}
