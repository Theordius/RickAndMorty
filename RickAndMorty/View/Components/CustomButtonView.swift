//
//  CustomButtonView.swift
//  RickAndMorty
//
//  Created by Rafał Gęsior on 24/07/2023.
//

import SwiftUI

struct CustomButtonView: View {
    //MARK: - PROPERTIES
       
    //MARK: - BODY
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 12)
                .fill(
                    LinearGradient(colors: [
                        .white,
                        .customGreenLight,
                        .customGreenAdaptive],
                       startPoint: .top,
                       endPoint: .bottom)
                )
            RoundedRectangle(cornerRadius: 12)
                .stroke(
                    LinearGradient(
                        colors: [
                            .customGrayLight,
                            .customGrayMedium],
                        startPoint: .top,
                        endPoint: .bottom
                    ),
                    lineWidth: 4
                )
            
            Image(systemName: "questionmark.bubble")
                .fontWeight(.black)
                .font(.system(size: 30))
                .foregroundStyle(
                    LinearGradient(
                    colors: [
                        .customSalmonLight,
                        .blue,
                        ],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing)
                )
        } //: ZSTACK
        .frame(width: 88, height: 44)
    }
}

//MARK: - PREVIEW
#Preview {
    CustomButtonView()
        .padding()
}
