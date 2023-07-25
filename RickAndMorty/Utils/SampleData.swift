//
//  SampleData.swift
//  RickAndMorty
//
//  Created by Rafał Gęsior on 25/07/2023.
//

import SwiftUI

struct SampleData {
    static let episodeExample = Episode(
        id: 1,
        name: "Pilot",
        airDate: "December 2, 2013",
        episode: "S01E01",
        characters: [
            URL(string: "https://rickandmortyapi.com/api/character/1")!,
            URL(string: "https://rickandmortyapi.com/api/character/2")!,
           
        ],
        url: URL(string: "https://rickandmortyapi.com/api/episode/1")!,
        created: "2017-11-10T12:56:33.798Z"
    )

    static let characterExample = Character(
        id: 1,
        name: "Rick Sanchez",
        status: "Alive",
        species: "Human",
        gender: "Male",
        image: URL(string: "https://rickandmortyapi.com/api/character/avatar/1.jpeg")!)
}

