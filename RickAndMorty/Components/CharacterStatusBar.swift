//
//  CharacterStatusBar.swift
//  RickAndMorty
//
//  Created by Rafał Gęsior on 27/07/2023.
//

import SwiftUI

struct CharacterStatusBar: View {
    //MARK: - PROPERTIES
    @StateObject var viewModel = ViewModel()
    let character: Character
    
    //MARK: - BODY
    var body: some View {
        HStack {
          Spacer()
            Text(String(localized: "status :").uppercased())
                .modifier(GradientTextModifier())
                .modifier(HeaderTextModifier())
            Image(systemName: "circle.fill")
                .foregroundColor(circleColor(for: character.status))
            Spacer()
        }
    }
}

private func circleColor(for status: String) -> Color {
    switch status {
       case "Alive":
           return .green
       case "Dead":
           return .red
       case "unknown":
           return .yellow
       default:
           return .white
       }
   }

//MARK: - PREVIEW
struct CharacterStatusBar_Previews: PreviewProvider {
    static var previews: some View {
        CharacterStatusBar(character: SampleData.characterExample)
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
    }
}
