// AstronomyDetailRouter.swift
// Copyright © Aleksandr Dorofeev. All rights reserved.

import StoreKit
import UIKit

/// Навигация экрана с деталями созвездия
final class AstronomyDetailRouter: AstronomyDetailRoutingLogic {
    // MARK: - Public properties

    weak var viewController: UIViewController?

    // MARK: - Private properties

    private let dataStore: AstronomyDetailDataStoreProtocol

    // MARK: - Initializers

    init(dataStore: AstronomyDetailDataStoreProtocol) {
        self.dataStore = dataStore
    }

    func showDeepLink(url: URL, linkId: Int) {
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            let storeViewController = SKStoreProductViewController()
            storeViewController.loadProduct(
                withParameters: [SKStoreProductParameterITunesItemIdentifier: NSNumber(value: linkId)],
                completionBlock: nil
            )
            viewController?.present(storeViewController, animated: true)
        }
    }
}
