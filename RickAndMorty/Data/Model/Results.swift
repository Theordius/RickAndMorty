//
//  Results.swift
//  RickAndMorty
//
//  Created by Rafał Gęsior on 25/07/2023.
//

import Foundation

struct Results<T: Decodable>: Decodable {
    let results: [T]
}
