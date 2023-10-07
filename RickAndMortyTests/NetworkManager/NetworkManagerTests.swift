//
//  NetworkManagerTests.swift
//  RickAndMortyTests
//
//  Created by Rafał Gęsior on 26/07/2023.
//

import XCTest
@testable import RickAndMorty

final class NetworkManagerTests: XCTestCase {
    private var vc: CharactersViewModel!
    private var mockNetworkManager: MockNetworkManager!

    @MainActor override func setUp() {
        super.setUp()
        mockNetworkManager = MockNetworkManager()
        mockNetworkManager.character = Character.characterExample
        mockNetworkManager.error = nil
        vc = CharactersViewModel(networkManager: mockNetworkManager)
    }

    @MainActor
    func testFetchCharacter() async {
        // Given
        let apiURL = "https://rickandmortyapi.com/api/character/1"
        let mockCharacter = Character.characterExample

        mockNetworkManager.character = mockCharacter

        let expectedName = mockCharacter.name
        let expectedStatus = mockCharacter.status

        // When
        do {
            let result: Results<Character> = try await mockNetworkManager.fetchData(from: apiURL)

            // Then
            guard let firstCharacter = result.results.first else {
                XCTFail("No characters found")
                return
            }

            XCTAssertEqual(firstCharacter.name, expectedName, "Expected name to be \(expectedName), but got \(firstCharacter.name)")
            XCTAssertEqual(firstCharacter.status, expectedStatus, "Expected status to be \(expectedStatus), but got \(firstCharacter.status)")

        } catch {
            XCTFail("Unexpected error: \(error)")
        }
    }


    @MainActor
    func testFetchCharacterError() async {
        let apiURL = "https://rickandmortyapi.com/api/character/1"
        mockNetworkManager.error = .serverError
        do {
            let _: Results<Character> = try await mockNetworkManager.fetchData(from: apiURL)
            XCTFail("Expected serverError but got a result")
        } catch NetworkError.serverError {

        } catch {
            XCTFail("Unexpected error: \(error)")
        }
    }


    @MainActor func testTitleAndMessageForServerError() throws {
        let titleAndMessage = vc.titleAndMessageForTesting(for: .serverError)
        XCTAssertEqual("Server Error", titleAndMessage.0)
        XCTAssertEqual("We could not process your request. Please try again.", titleAndMessage.1)
    }
    @MainActor func testTitleAndMessageForNetworkError() throws {
        let titleAndMessage = vc.titleAndMessageForTesting(for: .decodingError)
        XCTAssertEqual("Network Error", titleAndMessage.0)
        XCTAssertEqual("Ensure you are connected to the internet. Please try again.", titleAndMessage.1)
    }
}
