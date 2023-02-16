// SceneDelegate.swift
// Copyright © Aleksandr Dorofeev. All rights reserved.

import UIKit

/// Scene Delegate
final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
  // MARK: - Public properties

    var window: UIWindow?

  // MARK: - Public methods

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        let viewController = ViewController()
        window.rootViewController = viewController
        self.window = window
        window.makeKeyAndVisible()
    }
}
