//
//  AppView.swift
//  RickAndMorty
//
//  Created by Rafał Gęsior on 24/07/2023.
//

import SwiftUI

struct AppView: View {
    //MARK: - PROPERTIES
    @EnvironmentObject private var launchScreenState: LaunchScreenStateManager
    //MARK: - BODY
    var body: some View {
        TabView {
            Group {
                ContentView()
                    .tabItem{
                        Image(systemName:"house.fill")
                        Text(String(localized: "About"))
                    }
                
                EpisodesView()
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
                    }
            }
        }
        .task {
            try? await Task.sleep(for: Duration.seconds(1))
            self.launchScreenState.dismiss()
        }
        .accentColor(Color.black)
        .onAppear {
                UITabBar.appearance().backgroundColor = UIColor.systemBackground
                UITabBar.appearance().isTranslucent = true
           
            }
    }
}

//MARK: - PREVIEW
struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
            .environmentObject(LaunchScreenStateManager())
    }
}
