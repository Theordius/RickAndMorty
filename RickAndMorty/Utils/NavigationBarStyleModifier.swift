//
//  NavigationBarStyleModifier.swift
//  RickAndMorty
//
//  Created by Rafał Gęsior on 26/07/2023.
//

import SwiftUI

struct NavigationBarStyleModifier: ViewModifier {

    func body(content: Content) -> some View {
        content
            .padding(.horizontal, 15)
            .padding(.bottom, 10)
            .padding(.top, topPadding)
            .background(Color.white)
            .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 5)
    }

    private var topPadding: CGFloat {
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            return windowScene.windows.first?.safeAreaInsets.top ?? 0
        }
        return 0
    }
}
