//
//  PulsingAnimationView.swift
//  RickAndMorty
//
//  Created by Rafał Gęsior on 03/03/2025.
//


import SwiftUI

struct PulsingImageView: View {
    let url: URL
    @State private var pulse = false

    var body: some View {
        ImageLoader(url: url)
            .aspectRatio(contentMode: .fit)
            .clipShape(Circle())
            .shadow(color: Color.customBlackTransparentDark, radius: 12, x: 0, y: 0)
            .frame(width: 240, height: 240)
            .scaleEffect(pulse ? 1 : 0.9)
            .opacity(pulse ? 1 : 0.95)
            .onAppear {
                withAnimation(Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: true)) {
                    pulse.toggle()
                }
            }
    }
}
