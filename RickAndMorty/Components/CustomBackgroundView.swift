//
//  CustomBackgroundView.swift
//  RickAndMorty
//
//  Created by Rafał Gęsior on 24/07/2023.
//

import SwiftUI

struct CustomBackgroundView: View {
    var body: some View {
        let screenSize = UIScreen.main.bounds.size
        ZStack {
            // MARK: - 3. DEPTH
            Color.customGreenDark
                .cornerRadius(40)
                .offset(y: 12)
            
            // MARK: - 2. LIGHT
            Color.customGreenLight
                .cornerRadius(40)
                .offset(y: 3)
                .opacity(0.85)
            
            // MARK: - 1. SURFACE
            
            LinearGradient(colors: [
                Color.customGreenLight,
                Color.customGreenMedium],
                startPoint: .top,
                endPoint: .bottom
            )
            .cornerRadius(40)
        }
        .background(
            Image("background")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: screenSize.width, height: screenSize.height) 
        )
        .edgesIgnoringSafeArea(.all)
    }
}


//MARK: - PREVIEW
struct CustomBackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        CustomBackgroundView()
            .padding()
    }
}
