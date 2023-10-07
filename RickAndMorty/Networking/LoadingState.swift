//
//  LoadinState.swift
//  RickAndMorty
//
//  Created by Rafał Gęsior on 07/10/2023.
//

import Foundation

enum LoadingState: Equatable {
    case loading
    case loaded
    case error(NetworkError)
}
