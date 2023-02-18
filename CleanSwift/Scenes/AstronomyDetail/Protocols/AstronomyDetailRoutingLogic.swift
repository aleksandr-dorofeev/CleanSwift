// AstronomyDetailRoutingLogic.swift
// Copyright © Aleksandr Dorofeev. All rights reserved.

import Foundation

/// Протокол навигации второго экрана
protocol AstronomyDetailRoutingLogic {
    func showDeepLink(url: URL, linkId: Int)
}
