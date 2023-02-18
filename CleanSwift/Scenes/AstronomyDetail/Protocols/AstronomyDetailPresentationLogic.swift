// AstronomyDetailPresentationLogic.swift
// Copyright © Aleksandr Dorofeev. All rights reserved.

/// Протокол логики презентации на экране деталей
protocol AstronomyDetailPresentationLogic {
    func presentInitForm(_ response: ResponseAstronomyDetailModel)
    func presentDetailChanged(_ response: ResponseChangedAstronomyDetailModel)
    func presentDeepLink(_ response: ResponseDeepLinkModel)
}
