//
//  CustomLaunchScreen.swift
//  RickAndMorty
//
//  Created by Rafał Gęsior on 27/07/2023.
//

import SwiftUI

struct CustomLaunchScreen: View {
    @EnvironmentObject private var launchScreenState: LaunchScreenStateManager
    @State private var firstAnimation = false
    @State private var secondAnimation = false
    @State private var startFadeoutAnimation = false
    
    @ViewBuilder
    private var image: some View {
        Image(systemName: "hurricane.circle")
            .resizable()
            .scaledToFit()
            .frame(width: 240, height: 240)
            .foregroundColor(.white)
            .rotationEffect(firstAnimation ? Angle(degrees: 900) : Angle(degrees: 1800))
            .scaleEffect(secondAnimation ? 0 : 1)
            .offset(y: secondAnimation ? 400 : 0)
    }
    
    @ViewBuilder
    private var backgroundColor: some View {
        ZStack {
            Image("background")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
        }
    }
    
    private let animationTimer = Timer
        .publish(every: 0.5, on: .current, in: .common)
        .autoconnect()
    
    var body: some View {
        ZStack {
            backgroundColor
            image
        }.onReceive(animationTimer) { timerValue in
            updateAnimation()
        }.opacity(startFadeoutAnimation ? 0 : 1)
    }
    
    private func updateAnimation() {
        switch launchScreenState.state {
        case .firstStep:
            withAnimation(.easeInOut(duration: 0.9)) {
                firstAnimation.toggle()
            }
        case .secondStep:
            if secondAnimation == false {
                withAnimation(.linear) {
                    self.secondAnimation = true
                    startFadeoutAnimation = true
                }
            }
        case .finished:
            break
        }
    }
}

struct CustomLaunchScreen_Previews: PreviewProvider {
    static var previews: some View {
        CustomLaunchScreen()
            .environmentObject(LaunchScreenStateManager())
    }
}
