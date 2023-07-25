//
//  Characters.swift
//  RickAndMorty
//
//  Created by Rafał Gęsior on 24/07/2023.
//

import Foundation

struct Location: Codable {
    let name: String
    let url: URL
}

struct Character: Codable, Identifiable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin: Location
    let location: Location
    let image: URL
    let episode: [URL]
    let url: URL
    let created: Date
}


