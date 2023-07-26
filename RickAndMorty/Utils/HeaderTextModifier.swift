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
            .font(.system(size: 16))
            .foregroundColor(Color.white)
    }
}
