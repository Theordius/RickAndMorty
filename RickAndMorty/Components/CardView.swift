//
//  CardView.swift
//  RickAndMorty
//
//  Created by Rafał Gęsior on 24/07/2023.
//

import SwiftUI

struct CardView: View {
    //MARK: - PROPERTIES
    let name: String = "Rick Sanchez"
    let description: String = "some kind of information about this character"
    let imageURL = URL(string: "https://rickandmortyapi.com/api/character/avatar/\(Int.random(in: 1...10)).jpeg")
    
    //MARK: - BODY
    var body: some View {
        //MARK: - CARD
        ZStack {
            CustomBackgroundView()
            VStack {
                //MARK: - HEADER
                VStack(alignment: .leading) {
                    
                    Text(name)
                        .fontWeight(.black)
                        .font(.system(size: 24))
                        .foregroundStyle(
                            LinearGradient(
                                colors: [.customGrayLight, .customGrayMedium],
                                startPoint: .top, endPoint: .bottom)
                        )
                    Divider().padding(.bottom)
                    Text(description)
                        .multilineTextAlignment(.leading)
                        .italic()
                        .foregroundColor(.customGrayMedium)
                } //: HEADER
                .padding(.horizontal, 30)
                
                
                //MARK: - MAIN CONTENT
                ZStack {
                    Circle()
                        .fill(
                            LinearGradient(colors: [
                                Color.customIndigoMedium,
                                Color.customSalmonLight
                            ],
                                           startPoint: .topLeading,
                                           endPoint: .bottomTrailing
                                          )
                        )
                        .frame(width: 256, height: 256)
                    URLImage(url: imageURL!)
                        .scaledToFit()
                        .frame(width: 240, height: 240)
                        .clipShape(Circle())
                    
                }
                Text("")
                Button {
                    // ACTION: Show a Sheet
                } label: {
                    CustomButtonView()
                }
            }
        } //: CARD
        .frame(width: 320, height: 570)
    }
}

//MARK: - PREVIEW
struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
