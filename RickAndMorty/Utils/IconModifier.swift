//
//  IconModifier.swift
//  RickAndMorty
//
//  Created by Rafał Gęsior on 26/07/2023.
//

import Foundation
import SwiftUI

struct IconModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 42, height: 42, alignment: .center)
    }
}
