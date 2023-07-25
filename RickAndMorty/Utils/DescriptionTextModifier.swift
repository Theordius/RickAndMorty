//
//  DescriptionTextModifier.swift
//  RickAndMorty
//
//  Created by Rafał Gęsior on 24/07/2023.
//

import SwiftUI

struct DescriptionTextModifier: ViewModifier {
    func body(content: Content) -> some View {
            content
            .multilineTextAlignment(.leading)
            .italic()
    }
}
