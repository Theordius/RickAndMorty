//
//  NetworkManagerTests.swift
//  RickAndMortyTests
//
//  Created by Rafał Gęsior on 26/07/2023.
//

import XCTest
@testable import RickAndMorty

class NetworkManagerTests: XCTestCase {
    var vc: ViewModel!
    var mockManager: MockNetworkManager!
    
    class MockNetworkManager: DataManagable {
        var character: Character?
        var error: NetworkError?
        
        func fetchData<T>(from api: String, completion: @escaping (Result<T, NetworkError>) -> Void) {
            if error != nil {
                completion(.failure(error!))
                return
            }
            character = Character(id: 1, name: "Rick Sanchez", status: "Alive", species: "Human", gender: "Male", image: URL(string: "https://rickandmortyapi.com/api/character/avatar/1.jpeg"))
        }
    }
    
    @MainActor override func setUp() {
        super.setUp()
        vc = ViewModel()
        mockManager = MockNetworkManager()
    }
    
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





