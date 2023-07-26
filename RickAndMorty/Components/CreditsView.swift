//
//  CreditsView.swift
//  RickAndMorty
//
//  Created by Rafał Gęsior on 26/07/2023.
//

import SwiftUI

struct CreditsView: View {
    //MARK: - PROPERTIES
    
    //MARK: - BODY
    var body: some View {
        VStack {
            Image("compass")
                .resizable()
                .scaledToFit()
                .frame(width: 128, height: 128)
            
            Text("""
    Copyright © Rafal Gesior
    All right reserved
    """)
            .font(.footnote)
        .multilineTextAlignment(.center)
        } //: VSTACK
        .padding()
        .opacity(0.4)
    }
}

//MARK: - PREVIEW
struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
            .padding()
            
    }
}
