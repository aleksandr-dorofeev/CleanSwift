// AstronomyInteractor.swift
// Copyright © Aleksandr Dorofeev. All rights reserved.

import Foundation

/// Интерактор астрономического экрана
final class AstronomyInteractor: AstronomyBusinessLogic, AstronomyDataStoreProtocol {
    // MARK: - Public properties

    var presenter: AstronomyPresentationLogic?
    var networkAstronomyWorker: AstronomyNetworkWorkerProtocol
    var title: String?
    var explanation: String?

    // MARK: - Initializers

    init(networkAstronomyWorker: AstronomyNetworkWorkerProtocol) {
        self.networkAstronomyWorker = networkAstronomyWorker
    }

    // MARK: - Public methods

    func fetchAstronomy(_ request: AstronomyModels.InitForm.Request) {
        networkAstronomyWorker.fetchAstronomyData { result in
            switch result {
            case let .success(data):
                self.title = data.title
                self.explanation = data.explanation
                self.fetchAstronomyImage(url: data.url)
            case let .failure(error):
                print(error.localizedDescription)
            }
        }
    }

    private func fetchAstronomyImage(url: String) {
        networkAstronomyWorker.fetchAstronomyImageData(url: url) { result in
            switch result {
            case let .success(data):
                let response = AstronomyModels.InitForm.Response(
                    title: self.title ?? "",
                    explanation: self.explanation ?? "",
                    data: data
                )
                self.presenter?.presentAstronomy(response)
            case let .failure(error):
                print(error.localizedDescription)
            }
        }
    }
}
