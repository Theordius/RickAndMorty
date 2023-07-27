//
//  CustomLoader.swift
//  RickAndMorty
//
//  Created by Rafał Gęsior on 27/07/2023.
//

import SwiftUI

struct CustomLoader: View {
    // MARK: - PROPERTIES
    
    @State private var loadingData = 0.0
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    // MARK: - BODY
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(
                    LinearGradient(colors: [Color.customGreenDark,
                                            Color.customGreenMedium, Color.customGreenDark], startPoint: .top, endPoint: .bottom)
                )
                .frame(width: 240, height: 240)
                .cornerRadius(8).opacity(0.3)
            
            VStack(alignment: .center) {
                Image("rick")
                    .resizable()
                    .frame(width: 120, height: 120)
                
                ProgressView("Loading...", value: loadingData, total: 100.0)
                    .frame(width: 220)
                    .onReceive(timer) { _ in
                        if loadingData < 100 {
                            loadingData += 2
                        }
                    }
            }
            .accentColor(.blue)
        }
    }
}
struct CustomLoader_Previews: PreviewProvider {
    static var previews: some View {
        CustomLoader()
            .previewLayout(.sizeThatFits)
    }
}
