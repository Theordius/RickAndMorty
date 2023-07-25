//
//  Episodes.swift
//  RickAndMorty
//
//  Created by Rafał Gęsior on 24/07/2023.
//

import Foundation
import SwiftUI

struct Episode: Decodable, Identifiable {
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case airDate = "air_date"
        case episode
        case characters
        case url
        case created
    }
    
    let id: Int
    let name: String
    let airDate: String
    let episode: String
    let characters: [URL]
    let url: URL
    let created: String

}
