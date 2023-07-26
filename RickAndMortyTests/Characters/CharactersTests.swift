//
//  CharactersTests.swift
//  RickAndMortyTests
//
//  Created by Rafał Gęsior on 26/07/2023.
//

import XCTest
@testable import RickAndMorty

class CharacterTests: XCTestCase {
    func testCanParse() throws {
        let json = """
        {
            "id": 1,
            "name": "Rick Sanchez",
            "status": "Alive",
            "species": "Human",
            "gender": "Male"
        }
        """
        
        let data = json.data(using: .utf8)!
        let result = try! JSONDecoder().decode(Character.self, from: data)
        
        XCTAssertEqual(result.id, 1)
        XCTAssertEqual(result.name, "Rick Sanchez")
        XCTAssertEqual(result.status, "Alive")
        XCTAssertEqual(result.species, "Human")
        XCTAssertEqual(result.gender, "Male")
    }


}
