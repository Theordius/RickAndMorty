//
//  CustomNavigationBar.swift
//  RickAndMorty
//
//  Created by Rafał Gęsior on 25/07/2023.
//

import SwiftUI

struct NavigationBarView: View {
    //MARK: - PROPERTIES
    @State private var isAnimated: Bool = false
    @State private var isShowingSettings = false
    @State private var isShowingAlert = false
    
    var title: String
    
    //MARK: - BODY
    var body: some View {
        HStack {
                   Button(action: {
                       isShowingAlert = true 
                   }, label: {
                       Image(systemName: "magnifyingglass")
                           .font(.title)
                           .foregroundColor(.black)
                   }) //: BUTTON
                   .alert(isPresented: $isShowingAlert, content: {
                       Alert(
                           title: Text("Feature under Development"),
                           message: nil,
                           dismissButton: .default(Text("OK"))
                       )
                   })
            Spacer()
            CustomNavigationBarHeader(navBarTitle: title)
                .italic()
                .opacity(isAnimated ? 1 : 0)
                .offset(x: 0, y: isAnimated ? 0 : -25)
                .onAppear(perform: {
                    withAnimation(.easeOut(duration: 0.5)) {
                        isAnimated.toggle()
                    }
                })
            
            Spacer()
            
            Button(action: {
                isShowingSettings = true
            }, label: {
                ZStack {
                    Image(systemName: "questionmark.circle")
                        .font(.title)
                        .foregroundColor(.black)
                        .sheet(isPresented: $isShowingSettings) {
                            SettingsView()
                        }
                    
                    Circle()
                        .fill(Color.red)
                        .frame(width: 14, height: 14, alignment: .center)
                        .offset(x: 13, y: -10)
                }
            }) //: BUTTON
        } //: HSTACK
    }
}

//MARK: - PREVIEW
struct NavigationBarView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBarView(title: "Episodes")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
