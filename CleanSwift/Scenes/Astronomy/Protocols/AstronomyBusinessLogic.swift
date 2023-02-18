// AstronomyBusinessLogic.swift
// Copyright © Aleksandr Dorofeev. All rights reserved.

/// Протокол бизнес логики Interactor'a астрономического экрана
protocol AstronomyBusinessLogic: AnyObject {
    func fetchAstronomy(_ request: RequestAstronomyModel)
}
