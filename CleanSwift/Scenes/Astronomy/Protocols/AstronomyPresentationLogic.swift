// AstronomyPresentationLogic.swift
// Copyright © Aleksandr Dorofeev. All rights reserved.

/// Протокол логики презентации
protocol AstronomyPresentationLogic: AnyObject {
    func presentAstronomy(_ response: ResponseAstronomyModel)
}
