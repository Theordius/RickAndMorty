//
//  CustomAdaptiveBackground.swift
//  RickAndMorty
//
//  Created by Rafał Gęsior on 26/07/2023.
//

/// Adaptive custom backround, if image was created both for dark and light mode it should work.

import SwiftUI

struct CustomAdaptiveBackground: View {
    //MARK: - PROPERTIES
    
    @ViewBuilder
    private var customBackground: some View {
        ZStack {
            Image("background")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
        }
    }
    
    //MARK: - BODY
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                customBackground
            }
        }
    }
}

//MARK: - PREVIEW
struct CustomAdaptiveBackground_Previews: PreviewProvider {
    static var previews: some View {
        CustomAdaptiveBackground()
    }
}


