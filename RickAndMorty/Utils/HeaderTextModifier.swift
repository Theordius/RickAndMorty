//
//  HeaderTextModifier.swift
//  RickAndMorty
//
//  Created by Rafał Gęsior on 24/07/2023.
//

import SwiftUI

struct HeaderTextModifier: ViewModifier {
    func body(content: Content) -> some View {
            content
            .fontWeight(.black)
            .multilineTextAlignment(.center)
            .font(.system(size: 24))
            .foregroundColor(Color.white)
    }
}
