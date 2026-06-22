//
//  CharacterCardBackground.swift
//  RickAndMorty
//
//  Created by Rafał Gęsior on 24/07/2023.
//

import SwiftUI

struct CharacterCardBackground: View {
    var body: some View {
            ZStack {
                // MARK: - 3. DEPTH
                Color.customGreenDark
                    .clipShape(.rect(cornerRadius: 40))
                    .offset(y: 12)
                
                // MARK: - 2. LIGHT
                Color.customGreenLight
                    .clipShape(.rect(cornerRadius: 40))
                    .offset(y: 3)
                    .opacity(0.85)
                
                // MARK: - 1. SURFACE
                LinearGradient(colors: [
                    Color.customGreenLight,
                    Color.customGreenMedium],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .clipShape(.rect(cornerRadius: 40))
            }
    }
}

//MARK: - PREVIEW
#Preview {
    CharacterCardBackground()
}
