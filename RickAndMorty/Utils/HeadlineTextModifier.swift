//
//  HeadlineTextModifier.swift
//  RickAndMorty
//
//  Created by Rafał Gęsior on 25/07/2023.
//


import SwiftUI

struct HeadlineTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .lineLimit(nil)
            .font(.system(.headline, design: .serif))
            .multilineTextAlignment(.center)
            .lineSpacing(8)
            .frame(maxWidth: 640, minHeight: 120)
    }
}
