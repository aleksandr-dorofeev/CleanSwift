// AstronomyNetworkWorker.swift
// Copyright © Aleksandr Dorofeev. All rights reserved.

import Foundation

/// Воркер сетевого запроса для экрана с астрономической информацией
final class AstronomyNetworkWorker: AstronomyNetworkWorkerProtocol {
    // MARK: - Private properties

    private let networkService: NetworkServiceProtocol

    // MARK: - Initializers

    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }

    // MARK: - Public methods

    func fetchAstronomyData(_ completion: @escaping ((Result<Astronomy, Error>) -> Void)) {
        networkService.fetchData(url: Constants.astronomyFullUrl, completion)
    }

    func fetchAstronomyImageData(url: String, _ completion: @escaping (Result<Data, Error>) -> Void) {
        networkService.fetchImageData(byUrl: url, completion)
    }
}
