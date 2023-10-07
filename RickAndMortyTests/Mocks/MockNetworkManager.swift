//
//  MockNetworkManager.swift
//  RickAndMortyTests
//
//  Created by Rafał Gęsior on 07/10/2023.
//

import Foundation
@testable import RickAndMorty

final class MockNetworkManager: DataManagable {
    var character: Character?
    var error: NetworkError?

    func fetchData<T: Decodable>(from api: String) async throws -> Results<T> {
        if let error = self.error {
            throw error
        }

        if T.self is Character.Type, let character = self.character as? T {
            let results = Results(results: [character])
            return results
        }

        throw NetworkError.serverError
    }
}


