//
//  ImageLoader.swift
//  RickAndMorty
//
//  Created by Rafał Gęsior on 24/07/2023.
//

/// Async image loader for the purposes of the app
import SwiftUI

struct URLImage: View {
    let url: URL
    
    var body: some View {
        AsyncImage(url: url) { phase in
            switch phase {
            case .empty:
                ProgressView()
            case .success(let image):
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(12)
            case .failure(_):
                Image(systemName: "xmark.square.fill")
            @unknown default:
                Image(systemName: "xmark.square.fill")
            }
        }
    }
}
