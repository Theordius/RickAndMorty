//
//  Characters.swift
//  RickAndMorty
//
//  Created by Rafał Gęsior on 24/07/2023.
//

import Foundation

struct Character: Hashable, Identifiable, Codable{
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case status
        case species
        case gender
        case image
   
    }
    
    let id: Int
    let name: String
    let status: String
    let species: String
    let gender: String
    let image: URL?
}



