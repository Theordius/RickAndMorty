//
//  ContentView.swift
//  RickAndMorty
//
//  Created by Rafał Gęsior on 24/07/2023.
//
import SwiftUI

struct ContentView: View {
    //MARK: - PROPERTIES
    @State private var pulseAnimation: Bool = false
   
    //MARK: - BODY
    var body: some View {
        NavigationStack {
            ZStack {
                CustomAdaptiveBackground()
                VStack(alignment: .center, spacing: 8) {
                    Spacer()
                    ImageLoader(url: SampleData.randomImage)
                        .aspectRatio(contentMode: .fit)
                        .clipShape(Circle())
                        .shadow(color: Color.customBlackTransparentDark, radius: 12, x: 0, y: 0)
                        .frame(width: 240, height: 240, alignment: .center)
                        .scaleEffect(self.pulseAnimation ? 1: 0.9)
                        .opacity(self.pulseAnimation ? 1 : 0.95)
                    
                        Text("Rick & Morty".uppercased())
                            .modifier(BoldTextModifier())
                        
                        Text("""
                            Welcome to the Rick & Morty App, created for all of you who wants to know more about this awesome series!
                            """)
                            .modifier(HeadlineTextModifier())
                            .foregroundColor(Color.customGreenLight)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                   
                    .padding(.bottom, 20) // Add padding at the bottom
                    Spacer()
                }
                .padding(.horizontal) // Add horizontal padding
                .onAppear {
                    withAnimation(Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: true)) {
                        self.pulseAnimation.toggle()
                    }
                }
            }
        } //: NAVIGATION STACK
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
