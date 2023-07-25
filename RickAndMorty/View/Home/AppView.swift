//
//  AppView.swift
//  RickAndMorty
//
//  Created by Rafał Gęsior on 24/07/2023.
//

import SwiftUI

struct AppView: View {
    //MARK: - PROPERTIES
    let tabBarAppearance = UITabBarAppearance()
    
    //MARK: - BODY
    var body: some View {
        ZStack {
            TabView {
                AboutView()
                    .tabItem{
                        Image(systemName:"square.grid.2x2")
                        Text(String(localized: "About"))
                        
                    }
                ContentView()
                    .tabItem {
                        Image(systemName:"list.star")
                        Text(String(localized: "Episodes"))
                    }
                AliveCharactersView(characters: [SampleData.characterExample, SampleData.characterExample])
                    .tabItem {
                        Image(systemName:"heart.fill")
                        Text(String(localized: "Alive"))
                    }
                DeadCharactersView(characters: [SampleData.characterExample, SampleData.characterExample])
                    .tabItem {
                        Image(systemName:"heart.slash.fill")
                        Text(String(localized: "Dead"))
                            .foregroundColor(Color.white)
                    }
            }
        } // TAB
        .accentColor(Color.yellow)
        
        .onAppear {
            tabBarAppearance.configureWithOpaqueBackground()
            tabBarAppearance.backgroundColor = UIColor.white
            tabBarAppearance.stackedLayoutAppearance.normal.iconColor = UIColor.black
            tabBarAppearance.stackedLayoutAppearance.selected.iconColor = UIColor.yellow
            
            UITabBar.appearance().standardAppearance = tabBarAppearance
        }
        
    }
}

//MARK: - PREVIEW
struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
