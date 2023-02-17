// BaseRouter.swift
// Copyright © Aleksandr Dorofeev. All rights reserved.

import UIKit

/// Базовый роутер навигации
class BaseRouter: BaseRouterProtocol {
    // MARK: - Public properties

    weak var rootViewController: UIViewController?

    // MARK: - Initializers

    init(rootViewController: UIViewController? = nil) {
        self.rootViewController = rootViewController
    }

    // MARK: - Public methods

    func push(to viewController: UIViewController, sender: Any?) {
        guard let rootViewController = rootViewController else { return }
        rootViewController.show(viewController, sender: sender)
    }

    func pop() {
        guard let parentViewController = rootViewController?.parent as? UINavigationController else { return }
        parentViewController.popViewController(animated: true)
    }
}
