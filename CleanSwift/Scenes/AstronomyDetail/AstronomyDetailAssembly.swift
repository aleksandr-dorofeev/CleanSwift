// AstronomyDetailAssembly.swift
// Copyright © Aleksandr Dorofeev. All rights reserved.

import UIKit

/// Сборщик экрана с деталями о созвездии
enum AstronomyDetailAssembly {
    // MARK: - Public methods

    static func build(title: String, explanation: String) -> UIViewController {
        let view = AstronomyDetailViewController()
        let interactor = AstronomyDetailInteractor(title: title, explanation: explanation)
        let router = AstronomyDetailRouter(dataStore: interactor)
        let presenter = AstronomyDetailPresenter()
        interactor.presenter = presenter
        view.interactor = interactor
        view.router = router
        router.viewController = view
        presenter.view = view
        return view
    }
}
