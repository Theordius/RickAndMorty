//
//  AboutView.swift
//  RickAndMorty
//
//  Created by Rafał Gęsior on 24/07/2023.
//

import SwiftUI

struct AboutView: View {
    //MARK: - PROPERTIES
    
    @State private var pulseAnimation: Bool = false
    let imageURL = URL(string: "https://rickandmortyapi.com/api/character/avatar/\(Int.random(in: 1...10)).jpeg")
    
    //MARK: - BODY
    var body: some View {
        VStack {
            Spacer()
            ImageLoader(url: imageURL!)
                .aspectRatio(contentMode: .fill)
                .clipShape(Circle())
                .frame(width: 240, height: 240, alignment: .center)
                .shadow(color: Color.customBlackTransparentDark, radius: 12, x: 0, y: 0)
                .scaleEffect(self.pulseAnimation ? 1: 0.9)
                .opacity(self.pulseAnimation ? 1 : 0.95)
            
            VStack {
                Text("Rick & Morty".uppercased())
                    .font(.system(size: 42, weight: .bold, design: .serif))
                    .foregroundColor(Color.white)
                    .padding()
                    .shadow(color: Color.customBlackTransparentDark, radius: 4, x: 0, y: 4)
                
                Text("""
Welcome to the Rick & Morty App, created for all of you who wants to know more about this awesome series!
""")
                .lineLimit(nil)
                .font(.system(.headline, design: .serif))
                .foregroundColor(Color.customGreenLight)
                .multilineTextAlignment(.center)
                .lineSpacing(8)
                .frame(maxWidth: 640, minHeight: 120)
            }
            .padding()
            Spacer()
        }
        .background(
            Image("background")
                .resizable()
                .aspectRatio(contentMode: .fill)
        )
        .edgesIgnoringSafeArea(.all)
        .onAppear {
            withAnimation(Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: true)) {
                self.pulseAnimation.toggle()
            }
        }
    }
}
    
    
    //MARK: - PREVIEW
    struct AboutView_Previews: PreviewProvider {
        static var previews: some View {
            AboutView()
        }
    }
