//
//  DataManagable.swift
//  RickAndMorty
//
//  Created by Rafał Gęsior on 24/07/2023.
//

import Foundation

protocol DataManagable {
    func fetchData<T: Decodable>(from api: String, completion: @escaping (Result<T, NetworkError>) -> Void)
}

enum NetworkError: Error {
    case serverError
    case decodingError
}

class NetworkManager {
    func fetchData<T: Decodable>(from api: String, completion: @escaping (Result<T, NetworkError>) -> Void) {
        if let url = URL(string: api) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                DispatchQueue.main.async {
                    guard let data = data, error == nil else {
                        completion(.failure(.serverError))
                        return
                    }
                    do {
                        let decoder = JSONDecoder()
                        let decodedData = try decoder.decode(T.self, from: data)
                       
                        completion(.success(decodedData))
                    } catch {
                        completion(.failure(.decodingError))
                    }
                }
            }
            task.resume()
        }
    }
}


