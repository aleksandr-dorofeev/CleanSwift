// AstronomyNetworkWorkerProtocol.swift
// Copyright © Aleksandr Dorofeev. All rights reserved.

import Foundation

/// Протокол для астрономического запроса
protocol AstronomyNetworkWorkerProtocol {
    func fetchAstronomyData(_ completion: @escaping ((Result<Astronomy, Error>) -> Void))
    func fetchAstronomyImageData(url: String, _ completion: @escaping (Result<Data, Error>) -> Void)
}
