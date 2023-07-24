//
//  DataModel.swift
//  RickAndMorty
//
//  Created by Rafał Gęsior on 24/07/2023.
//

import Foundation

struct ApplicationData: Codable {
    let id: Int
    let name: String
    let status: String
    let gender: String
    let image: String
}
