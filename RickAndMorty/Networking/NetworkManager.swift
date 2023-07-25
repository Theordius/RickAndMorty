//
//  DataManagable.swift
//  RickAndMorty
//
//  Created by Rafał Gęsior on 24/07/2023.
//

import Foundation

protocol DataManagable {
    func fetchData(from api: String, completion: @escaping (Result<Results, NetworkError>) -> Void)
}

enum NetworkError: Error {
    case serverError
    case decodingError
}

class NetworkManager: DataManagable, ObservableObject {
    @Published var episodes: [Episode] = []

    func fetchData(from api: String, completion: @escaping (Result<Results, NetworkError>) -> Void) {
        if let url = URL(string: api) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                DispatchQueue.main.async {
                    guard let data = data, error == nil else {
                        completion(.failure(.serverError))
                        return
                    }
                    do {
                        let results = try JSONDecoder().decode(Results.self, from: data)
                        completion(.success(results))
                    } catch {
                        completion(.failure(.decodingError))
                    }
                }
            }
            task.resume()
        }
    }
}

