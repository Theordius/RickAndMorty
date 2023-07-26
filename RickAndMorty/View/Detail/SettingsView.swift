//
//  AppInfoView.swift
//  RickAndMorty
//
//  Created by Rafał Gęsior on 26/07/2023.
//

import SwiftUI

struct SettingsView: View {
    //MARK: - PROPERTIES
    @Environment(\.presentationMode) var presentationMode
  
    //MARK: - BODY
    
    var body: some View {
        NavigationStack {
            ZStack {
                CustomAdaptiveBackground()
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 20) {
                        
                        //MARK: - SECTION 1
                        
                        GroupBox(
                            label: SettingsLabelView(labelText: "About the Application", labelImage: "questionmark.circle")
                        ) {
                            Divider().padding(.vertical, 4)
                            
                            Text("This application was build for recruitment purposes entirely in SwiftUI without usage of 3rd party libraries")
                                .italic()
                                .padding(.vertical)
                                .frame(minWidth: 60)
                                .layoutPriority(1)
                                .font(.footnote)
                                .multilineTextAlignment(.leading)
                            
                                .padding()
                                .background(
                                    Color(UIColor.tertiarySystemBackground)
                                        .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                                )
                        }
                        
                        //MARK: - SECTION 2
                        GroupBox(
                            label: SettingsLabelView(labelText: "Application", labelImage: "apps.iphone")
                        ) {
                            SettingsRowView(name: "Developer", content: "Rafal Gesior")
                            SettingsRowView(name: "Compability", content: "iOS 15")
                            SettingsRowView(name: "Website", linkLabel: "Sii Poland", linkDestination: "www.sii.pl/en/")
                            SettingsRowView(name: "Twitter", linkLabel: "@rufus83", linkDestination: "twitter.com/rufus_gaming")
                            SettingsRowView(name: "SwiftUI", content: "4.0")
                            SettingsRowView(name: "Version", content: "1.0")
                            
                        } //: BOX
                    } //: VSTACK
                    .navigationBarTitle(Text("Information"), displayMode: .large)
                    .navigationBarItems(
                        trailing:
                            Button(action: {
                                presentationMode.wrappedValue.dismiss()
                            })
                        {
                            Image(systemName: "xmark")
                        }
                    )
                    .padding()
                }
            } //: SCROLL
        } //: NAVIGATION
        .preferredColorScheme(.dark)
    }
}

//MARK: - PREVIEW
struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .preferredColorScheme(.dark)
            .previewDevice("iPhone 11 Pro")
    }
}
