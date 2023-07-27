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
    let screenSize = UIScreen.main.bounds.size
    
    //MARK: - BODY
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image("background")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: geometry.size.width, height: screenSize.height)
            }
            .ignoresSafeArea(.all, edges: .all)
        }
    }
}

//MARK: - PREVIEW
struct CustomAdaptiveBackground_Previews: PreviewProvider {
    static var previews: some View {
        CustomAdaptiveBackground()
    }
}


