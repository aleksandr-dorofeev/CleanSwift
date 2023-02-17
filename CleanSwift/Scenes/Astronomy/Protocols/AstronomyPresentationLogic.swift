// AstronomyPresentationLogic.swift
// Copyright © Aleksandr Dorofeev. All rights reserved.

import Foundation

/// Протокол логики презентации
protocol AstronomyPresentationLogic: AnyObject {
    func presentAstronomy(_ response: AstronomyModels.InitForm.Response)
}
