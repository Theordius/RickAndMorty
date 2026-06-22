//
//  ContentView.swift
//  RickAndMorty
//
//  Created by Rafał Gęsior on 24/07/2023.
//
import SwiftUI

struct ContentView: View {
    //MARK: - Properties
    @State private var pulseAnimation: Bool = false

    //MARK: - Body
    var body: some View {
        NavigationStack {
            ZStack {
                CustomAdaptiveBackground()
                VStack(alignment: .center, spacing: 8) {

                    Spacer()

                    if let url = Character.randomImage {
                        PulsingImageView(url: url)
                    } else {
                        Image(systemName: "photo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 240, height: 240)
                    }

                    Text("Rick & Morty".uppercased())
                        .modifier(BoldTextModifier())

                    Text(String(localized: """
                            Welcome to the Rick & Morty App, created for all of you who wants to know more about this awesome series!
                            """))
                    .modifier(HeadlineTextModifier())
                    .foregroundStyle(Color.customGreenLight)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)

                    .padding(.bottom, 20)
                    Spacer()
                }

                .padding(.horizontal)
            }
        } //: NAVIGATION STACK
        .accentColor(.yellow)
    }
}

#Preview {
    ContentView()
}
