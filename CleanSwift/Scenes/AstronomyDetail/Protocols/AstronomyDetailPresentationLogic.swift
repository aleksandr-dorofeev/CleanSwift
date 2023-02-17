// AstronomyDetailPresentationLogic.swift
// Copyright © Aleksandr Dorofeev. All rights reserved.

import Foundation

/// Протокол логики презентации на экране деталей
protocol AstronomyDetailPresentationLogic {
    func presentInitForm(_ response: AstronomyDetailModels.InitForm.Response)
    func presentDetailChanged(_ response: AstronomyDetailModels.DetailChanged.Response)
    func presentDeepLink(_ response: AstronomyDetailModels.DeepLinking.Response)
}
