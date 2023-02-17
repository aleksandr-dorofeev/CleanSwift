// NetworkServiceProtocol.swift
// Copyright © Aleksandr Dorofeev. All rights reserved.

import Foundation

/// Протокол сетевого сервиса
protocol NetworkServiceProtocol {
    func fetchData<T: Decodable>(url: String, _ completion: @escaping ((Result<T, Error>) -> Void))
    func fetchImageData(byUrl: String, _ completion: @escaping (Result<Data, Error>) -> Void)
}
