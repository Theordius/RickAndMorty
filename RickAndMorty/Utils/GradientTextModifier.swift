//
//  GradientTextModifier.swift
//  RickAndMorty
//
//  Created by Rafał Gęsior on 27/07/2023.
//

import SwiftUI

struct GradientTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundStyle(
                LinearGradient(
                    colors: [.customGrayLight, .customGrayMedium],
                    startPoint: .top, endPoint: .bottom)
            )
    }
}

