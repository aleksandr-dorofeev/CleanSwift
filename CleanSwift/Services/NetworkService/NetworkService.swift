// NetworkService.swift
// Copyright © Aleksandr Dorofeev. All rights reserved.

import Foundation

/// Сетевой сервис
final class NetworkService: NetworkServiceProtocol {
    // MARK: - Public Methods

    func fetchData<T: Decodable>(url: String, _ completion: @escaping ((Result<T, Error>) -> Void)) {
        guard let url = URL(string: url) else { return }
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else { return }
            do {
                let decodeData = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodeData))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }

    func fetchImageData(byUrl: String, _ completion: @escaping (Result<Data, Error>) -> ()) {
        guard let url = URL(string: byUrl) else { return }
        let session = URLSession.shared
        session.dataTask(with: url) { data, _, error in
            guard let data = data else { return }
            do {
                completion(.success(data))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
