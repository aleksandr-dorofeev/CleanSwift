// AstronomyAssembly.swift
// Copyright © Aleksandr Dorofeev. All rights reserved.

import UIKit

/// Сборщик астрономического экрана
enum AstronomyAssembly {
    // MARK: - Public methods

    static func build() -> UIViewController {
        let view = AstronomyViewController()
        let networkService = NetworkService()
        let astronomyNetworkWorker = AstronomyNetworkWorker(networkService: networkService)
        let interactor = AstronomyInteractor(networkAstronomyWorker: astronomyNetworkWorker)
        let router = AstronomyRouter(dataStore: interactor)
        let presenter = AstronomyPresenter()
        view.interactor = interactor
        view.router = router
        router.viewController = view
        interactor.presenter = presenter
        presenter.view = view
        return view
    }
}
