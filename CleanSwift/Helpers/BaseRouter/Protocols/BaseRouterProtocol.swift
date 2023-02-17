// BaseRouterProtocol.swift
// Copyright © Aleksandr Dorofeev. All rights reserved.

import UIKit

/// Протокол навигации базового роутера
protocol BaseRouterProtocol {
    var rootViewController: UIViewController? { get set }

    func push(to viewController: UIViewController, sender: Any?)
    func pop()
}
