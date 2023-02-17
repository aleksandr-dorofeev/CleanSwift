// AstronomyDetailBusinessLogic.swift
// Copyright © Aleksandr Dorofeev. All rights reserved.

import Foundation

/// Протокол бизнес логики Interactor'a экрана деталей о созвездии
protocol AstronomyDetailBusinessLogic {
    func requestInitForm(_ request: AstronomyDetailModels.InitForm.Request)
    func requestDetailChanged(_ request: AstronomyDetailModels.DetailChanged.Request)
    func requestDeepLink(_ request: AstronomyDetailModels.DeepLinking.Request)
}
