//
//  NetworkManagerTests.swift
//  RickAndMortyTests
//
//  Created by Rafał Gęsior on 26/07/2023.
//

import XCTest
@testable import RickAndMorty

        class NetworkManagerTests: XCTestCase {

            func testFetchCharacter() {
                let expectation = XCTestExpectation(description: "Fetch character from API")
                let apiURL = "https://rickandmortyapi.com/api/character/1"

                NetworkManager().fetchData(from: apiURL) { (result: Result<Character, NetworkError>) in
                    switch result {
                    case .success(let character):
                        XCTAssertEqual(character.name, "Rick Sanchez")
                        XCTAssertEqual(character.status, "Alive")

                        expectation.fulfill()

                    case .failure(let error):
                        XCTFail("Fetching character failed with error: \(error)")
                    }
                }

                wait(for: [expectation], timeout: 5.0)
            }
        }


    


