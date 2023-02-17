// AstronomyBusinessLogic.swift
// Copyright © Aleksandr Dorofeev. All rights reserved.

import Foundation

/// Протокол бизнес логики Interactor'a астрономического экрана
protocol AstronomyBusinessLogic: AnyObject {
    func fetchAstronomy(_ request: AstronomyModels.InitForm.Request)
}
