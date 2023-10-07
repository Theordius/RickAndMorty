//
//  DataManagable.swift
//  RickAndMorty
//
//  Created by Rafał Gęsior on 24/07/2023.
//

import Foundation

protocol DataManagable {
    func fetchData<T: Decodable>(from api: String) async throws -> Results<T>
}

import Foundation

enum NetworkError: Error {
    case serverError
    case decodingError
    case invalidURL
}

class NetworkManager: DataManagable {
    func fetchData<T: Decodable>(from api: String) async throws -> Results<T> {
        guard let url = URL(string: api) else {
            throw NetworkError.invalidURL
        }

        let (data, _) = try await URLSession.shared.data(from: url)

        do {
            let decoder = JSONDecoder()
            let decodedData = try decoder.decode(Results<T>.self, from: data)
            return decodedData
        } catch {
            throw NetworkError.decodingError
        }
    }
}
