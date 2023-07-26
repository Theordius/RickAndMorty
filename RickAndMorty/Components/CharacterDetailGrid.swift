//
//  CharacterDetailGrid.swift
//  RickAndMorty
//
//  Created by Rafał Gęsior on 26/07/2023.
//

import SwiftUI

struct CharacterDetailGrid: View {
    //MARK: - PROPERTIES
    let status: String
    let gender: String
    let species: String
    
    //MARK: - BODY
    
    var body: some View {
        HStack(alignment: .center, spacing: 4) {
            // 1st Column
            VStack(alignment: .leading, spacing: 4) {
                HStack() {
                    Text(String(localized: "Status:").uppercased())
                }
                Divider()
                HStack() {
                   
                    Text(String(localized: "Species:").uppercased())
                }
                Divider()
                HStack() {
                    Text(String(localized: "Gender:").uppercased())
                }
              
             
            }
            // 2nd Column
            VStack(alignment: .center, spacing: 16) {
                HStack {
                    Divider()
                }
                Image(systemName: "questionmark.app")
                    .font(Font.title.weight(.ultraLight))
                    .imageScale(.large)
                
                HStack {
                    Divider()
                }
            }
            
            // 3rd Column
            VStack(alignment: .trailing, spacing: 4) {
                HStack() {
                    Text(status.uppercased())
                       

                }
                Divider()
                HStack() {
                    Text(gender.uppercased())
              

                }
                Divider()
                HStack() {
                    Text(species.uppercased())
        
                }
            }
        }
        .modifier(HeaderTextModifier())
        .padding(.horizontal)
        .frame(maxHeight: 220)
    }
}

//MARK: - PREVIEW
struct CharacterDetailGrid_Previews: PreviewProvider {
    static var previews: some View {
        CharacterDetailGrid(status: "Test", gender: "Male", species: "Human")
    }
}
