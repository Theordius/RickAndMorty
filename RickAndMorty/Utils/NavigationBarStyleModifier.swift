//
//  NavigationBarStyleModifier.swift
//  RickAndMorty
//
//  Created by Rafał Gęsior on 26/07/2023.
//

import SwiftUI

struct NavigationBarStyleModifier: ViewModifier {
    let scenes = UIApplication.shared.connectedScenes

    
    func body(content: Content) -> some View {
        content
            .padding(.horizontal, 15)
            .padding(.bottom, 10)
            .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top ?? 0)
            .background(Color.white)
            .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 5)
    }
}
