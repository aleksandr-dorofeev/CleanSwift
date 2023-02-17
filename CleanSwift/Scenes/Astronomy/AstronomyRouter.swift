// AstronomyRouter.swift
// Copyright © Aleksandr Dorofeev. All rights reserved.

import UIKit

/// Навигация экрана с астрономической информацией
final class AstronomyRouter: AstronomyRoutingLogic {
    // MARK: Public properties

    var dataStore: AstronomyDataStoreProtocol
    var viewController: UIViewController?

    // MARK: - Initializers

    init(dataStore: AstronomyDataStoreProtocol) {
        self.dataStore = dataStore
    }

    // MARK: - Public methods

    func routeToAstronomyDetailScreen() {
        let astronomyDetailViewController = AstronomyDetailAssembly.build(
            title: dataStore.title ?? "",
            explanation: dataStore.explanation ?? ""
        )
        viewController?.navigationController?.pushViewController(astronomyDetailViewController, animated: true)
    }
}
