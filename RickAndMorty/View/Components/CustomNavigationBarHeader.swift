//
//  CustomNavigationBarHeader.swift
//  RickAndMorty
//
//  Created by Rafał Gęsior on 25/07/2023.
//

import SwiftUI

struct CustomNavigationBarHeader: View {
    //MARK: - PROPERTIES
    let navBarTitle: String
    
    //MARK: - BODY
    var body: some View {
        VStack(alignment: .center) {
            Text(String(localized: "Rick & Morty").uppercased())
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(.black)
            Text(navBarTitle.uppercased())
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(.black)
                
        } //: HSTACK
    }
}

//MARK: - PREVIEW
struct LogoView_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavigationBarHeader(navBarTitle: "Episodes")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
