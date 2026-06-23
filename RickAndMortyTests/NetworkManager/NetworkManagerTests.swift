//
//  NetworkManagerTests.swift
//  RickAndMortyTests
//
//  Created by Rafał Gęsior on 26/07/2023.
//

import XCTest
@testable import RickAndMorty

final class NetworkManagerTests: XCTestCase {

    @MainActor
    func testFetchCharacter() async throws {
        // Given
        let mockNetworkManager = MockNetworkManager()
        let mockCharacter = Character.characterExample
        mockNetworkManager.character = mockCharacter
        let apiURL = "https://rickandmortyapi.com/api/character/1"

        // When
        let result: Results<Character> = try await mockNetworkManager.fetchData(from: apiURL)

        // Then
        guard let firstCharacter = result.results.first else {
            XCTFail("No characters found")
            return
        }
        XCTAssertEqual(firstCharacter.name, mockCharacter.name)
        XCTAssertEqual(firstCharacter.status, mockCharacter.status)
    }

    @MainActor
    func testFetchCharacterError() async {
        let mockNetworkManager = MockNetworkManager()
        mockNetworkManager.error = .serverError
        let apiURL = "https://rickandmortyapi.com/api/character/1"

        do {
            let _: Results<Character> = try await mockNetworkManager.fetchData(from: apiURL)
            XCTFail("Expected serverError but got a result")
        } catch NetworkError.serverError {
            // Expected
        } catch {
            XCTFail("Unexpected error: \(error)")
        }
    }

    @MainActor
    func testTitleAndMessageForServerError() throws {
        let vc = CharactersViewModel(networkManager: MockNetworkManager())
        let titleAndMessage = vc.titleAndMessageForTesting(for: .serverError)
        XCTAssertEqual("Server Error", titleAndMessage.0)
        XCTAssertEqual("We could not process your request. Please try again.", titleAndMessage.1)
    }

    @MainActor
    func testTitleAndMessageForNetworkError() throws {
        let vc = CharactersViewModel(networkManager: MockNetworkManager())
        let titleAndMessage = vc.titleAndMessageForTesting(for: .decodingError)
        XCTAssertEqual("Network Error", titleAndMessage.0)
        XCTAssertEqual("Ensure you are connected to the internet. Please try again.", titleAndMessage.1)
    }
}
