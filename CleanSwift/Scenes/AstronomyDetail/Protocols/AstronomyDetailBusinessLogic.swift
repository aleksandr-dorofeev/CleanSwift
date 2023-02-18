// AstronomyDetailBusinessLogic.swift
// Copyright © Aleksandr Dorofeev. All rights reserved.

/// Протокол бизнес логики Interactor'a экрана деталей о созвездии
protocol AstronomyDetailBusinessLogic {
    func requestInitForm(_ request: RequestAstronomyDetailModel)
    func requestDetailChanged(_ request: RequestChangedAstronomyDetailModel)
    func requestDeepLink(_ request: RequestDeepLinkModel)
}
