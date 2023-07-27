//
//  NetworkAlertHandler.swift
//  RickAndMorty
//
//  Created by Rafał Gęsior on 26/07/2023.
//

//MARK: - ViewModel extension build for Unit Testing
extension ViewModel {
    private func displayError(_ error: NetworkError) {
        let titleAndMessage = titleAndMessage(for: error)
        self.showErrorAlert(title: titleAndMessage.0, message: titleAndMessage.1)
    }
    
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
        }
        return (title, message)
    }
    
    private func showErrorAlert(title: String, message: String) {
        errorAlert.title = title
        errorAlert.message = message
        
    }
    func titleAndMessageForTesting(for error: NetworkError) -> (String, String) {
        return titleAndMessage(for: error)
    }
    func forceFetchEpisodes() {
        fetchEpisodes()
    }
    
}
