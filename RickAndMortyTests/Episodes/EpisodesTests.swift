//
//  EpisodesTests.swift
//  RickAndMortyTests
//
//  Created by Rafał Gęsior on 26/07/2023.
//

import XCTest
@testable import RickAndMorty

final class EpisodesTests: XCTestCase {
    func testCanParse() throws {
        let json = """
        {
            "id": 1,
            "name": "Pilot",
            "air_date": "December 2, 2013",
            "episode": "S01E01",
            "characters": [
                "https://rickandmortyapi.com/api/character/1",
                "https://rickandmortyapi.com/api/character/2"
            ],
            "url": "https://rickandmortyapi.com/api/episode/1",
            "created": "2017-11-10T12:56:33.798Z"
        }
        """
        
        let data = json.data(using: .utf8)!
        let result = try! JSONDecoder().decode(Episode.self, from: data)
        
        XCTAssertEqual(result.id, 1)
        XCTAssertEqual(result.name, "Pilot")
        XCTAssertEqual(result.airDate, "December 2, 2013")
        XCTAssertEqual(result.episode, "S01E01")
        XCTAssertEqual(result.characters, [
            URL(string: "https://rickandmortyapi.com/api/character/1")!,
            URL(string: "https://rickandmortyapi.com/api/character/2")!
        ])
    }
}

