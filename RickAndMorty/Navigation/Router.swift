////
////  Router.swift
////  RickAndMorty
////
////  Created by Rafał Gęsior on 25/07/2023.
////
//
/// Started to build navigation based on enums, didn't finished though
/// with these class implemented path should be saved and even if the app crash the view will be restored


//import SwiftUI
//
//enum Route: Hashable, Codable, View {
//
//    case episodeDetails(Episode)
//    case characterDetails(Character)
//
//    var body: some View {
//        switch self {
//        case let .episodeDetails(episode):
//          EpisodeDetailView(episode: episode)
//        case let .characterDetails(character):
//            CharacterDetailView(character: character)
//        }
//    }
//}
//
///// Main Router class used to save the navigation path
//class Router: ObservableObject {
//    @Published var path = NavigationPath() {
//        didSet {
//            save()
//        }
//    }
//
//    private let savePath = URL.documentsDirectory.appending(path: "SavedPathStore")
//
//    init() {
//        if let data = try? Data(contentsOf: savePath) {
//            if let decoded = try? JSONDecoder().decode(NavigationPath.CodableRepresentation.self, from: data) {
//                path = NavigationPath(decoded)
//                return
//            }
//        }
//    }
//
//    func save() {
//        guard let representation = path.codable else { return }
//
//        do {
//            let data = try JSONEncoder().encode(representation)
//            try data.write(to: savePath)
//        } catch {
//            print("Failed to save navigation data")
//        }
//    }
//
//    func resetPath() {
//        path = NavigationPath()
//    }
//}

