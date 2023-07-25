//
//  BoldTextModifier.swift
//  RickAndMorty
//
//  Created by Rafał Gęsior on 25/07/2023.
//

import SwiftUI

struct BoldTextModifier: ViewModifier {
    func body(content: Content) -> some View {
            content
            .font(.system(size: 42, weight: .bold, design: .serif))
            .foregroundColor(Color.white)
            .multilineTextAlignment(.center)
            .padding()
            .shadow(color: Color.customBlackTransparentDark, radius: 4, x: 0, y: 4)
    }
}
