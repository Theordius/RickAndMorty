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
                .tabItem{
                    Image(systemName:"square.grid.2x2")
                    Text(String(localized: "About"))
                        
                }
            ContentView()
                .tabItem {
                    Image(systemName:"list.star")
                    Text(String(localized: "Episodes"))
                }
            AliveCharactersView()
                .tabItem {
                    Image(systemName:"heart.fill")
                    Text(String(localized: "Alive"))
                }
            DeadCharactersView()
                .tabItem {
                    Image(systemName:"heart.slash.fill")
                    Text(String(localized: "Dead"))
                        .foregroundColor(Color.white)
                }
        } // TAB
        .accentColor(Color.yellow)
      
        .onAppear {
                  let tabBarAppearance = UITabBarAppearance()
                  tabBarAppearance.configureWithOpaqueBackground()
                  tabBarAppearance.backgroundColor = UIColor.white
            
                  tabBarAppearance.stackedLayoutAppearance.normal.iconColor = UIColor.black
                  tabBarAppearance.stackedLayoutAppearance.selected.iconColor = UIColor.black
                  
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
