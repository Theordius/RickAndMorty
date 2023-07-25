//
//  CenterModifier.swift
//  RickAndMorty
//
//  Created by Rafał Gęsior on 24/07/2023.
//

import SwiftUI

struct CenterModifier: ViewModifier {
    func body(content: Content) -> some View {
        HStack {
            Spacer()
            content
            Spacer()
        }
    }
}
