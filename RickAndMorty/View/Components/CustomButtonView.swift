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
                    LinearGradient(colors: [
                        .customGrayLight,
                        .customGrayMedium],
                       startPoint: .top,
                       endPoint: .bottom),
                    lineWidth: 4)
            
            Image(systemName: "questionmark.bubble")
                .fontWeight(.black)
                .font(.system(size: 30))
                .foregroundStyle(LinearGradient(
                    colors: [
                        .customGrayLight,
                        .customGrayMedium],
                    startPoint: .top,
                    endPoint: .bottom)
                )
        } //: ZSTACK
        .frame(width: 88, height: 44)
    }
}

//MARK: - PREVIEW
struct CustomButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CustomButtonView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
