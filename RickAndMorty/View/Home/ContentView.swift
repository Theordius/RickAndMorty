//
//  ContentView.swift
//  RickAndMorty
//
//  Created by Rafał Gęsior on 24/07/2023.
//
import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                Spacer()
                NavigationBarView(title: "Episodes")
                    .padding(.horizontal, 15)
                    .padding(.bottom, 10)
                    .padding(.top,
                             UIApplication.shared.windows.first?.safeAreaInsets.top)
                    .background(Color.white)
                    .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 5)
                EpisodesView()
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
