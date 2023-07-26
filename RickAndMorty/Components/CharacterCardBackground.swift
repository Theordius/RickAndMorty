//
//  CharacterCardBackground.swift
//  RickAndMorty
//
//  Created by Rafał Gęsior on 24/07/2023.
//

import SwiftUI

struct CharacterCardBackground: View {
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                // MARK: - 3. DEPTH
                Color.customGreenDark
                    .cornerRadius(40)
                    .offset(y: 12)
                
                // MARK: - 2. LIGHT
                Color.customGreenLight
                    .cornerRadius(40)
                    .offset(y: 3)
                    .opacity(0.85)
                
                // MARK: - 1. SURFACE
                LinearGradient(colors: [
                    Color.customGreenLight,
                    Color.customGreenMedium],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .cornerRadius(40)
            }
            .frame(width: geometry.size.width - 20, height: geometry.size.height - 20)
            .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
        }
     
    }
}

//MARK: - PREVIEW
struct CharacterCardBackground_Previews: PreviewProvider {
    static var previews: some View {
        CharacterCardBackground()
    }
}
