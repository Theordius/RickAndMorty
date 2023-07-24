//
//  AppView.swift
//  RickAndMorty
//
//  Created by Rafał Gęsior on 24/07/2023.
//

import SwiftUI

struct AppView: View {
    //MARK: - PROPERTIES
    
    //MARK: - BODY
    var body: some View {
        TabView {
            AboutView()
                .tabItem({
                    Image(systemName:"ellipsis.viewfinder")
                    Text(String(localized: "About"))
                })
            ContentView()
                .tabItem({
                    Image(systemName:"ellipsis.viewfinder")
                    Text(String(localized: "Episodes"))
                })
            AliveCharactersView()
                .tabItem({
                    Image(systemName:"ellipsis.viewfinder")
                    Text(String(localized: "Alive"))
                })
            DeadCharactersView()
                .tabItem({
                    Image(systemName:"ellipsis.viewfinder")
                    Text(String(localized: "Dead"))
                })
        }
        .accentColor(Color.primary)
    }
}

//MARK: - PREVIEW
struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
