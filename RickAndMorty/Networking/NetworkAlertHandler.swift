//
//  NetworkAlertHandler.swift
//  RickAndMorty
//
//  Created by Rafał Gęsior on 26/07/2023.
//

//MARK: - ViewModel extension build for Unit Testing
extension CharactersViewModel {
    
    private func titleAndMessage(for error: NetworkError) -> (String, String) {
        let title: String
        let message: String
        switch error {
        case .serverError:
            title = "Server Error"
            message = "We could not process your request. Please try again."
        case .decodingError:
            title = "Network Error"
            message = "Ensure you are connected to the internet. Please try again."
        case .invalidURL:
            title = "Network Error"
            message = "Ensure you are connected to the internet. Please try again."
        }
        return (title, message)
    }

    func titleAndMessageForTesting(for error: NetworkError) -> (String, String) {
        return titleAndMessage(for: error)
    }
}
