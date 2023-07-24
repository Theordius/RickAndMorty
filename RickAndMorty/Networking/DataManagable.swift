//
//  DataManagable.swift
//  RickAndMorty
//
//  Created by Rafał Gęsior on 24/07/2023.
//

import Foundation

protocol DataManagable: AnyObject {
    func fetchData(forDataId dataId: String, completion: @escaping (Result<ApplicationData, NetworkError>) -> Void)
}

enum NetworkError: Error {
    case serverError
    case decodingError
}


class DataManager: DataManagable {
    func fetchData(forDataId dataId: String, completion: @escaping (Result<ApplicationData, NetworkError>) -> Void) {
      
        let urlString = "https://rickandmortyapi.com/api/character/\(dataId)"
        guard let url = URL(string: urlString) else {
            completion(.failure(.serverError))
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                guard let data = data, error == nil else {
                    completion(.failure(.serverError))
                    return
                }
                
                do {
                    let profile = try JSONDecoder().decode(ApplicationData.self, from: data)
                    completion(.success(profile))
                } catch {
                    completion(.failure(.decodingError))
                }
            }
        }.resume()
    }
}
