// AstronomyDetailDisplayLogic.swift
// Copyright © Aleksandr Dorofeev. All rights reserved.

import Foundation

/// Протокол логики для отображения подготовленной информации на экране деталей
protocol AstronomyDetailDisplayLogic: AnyObject {
    func displayInitForm(_ viewModel: AstronomyDetailModels.InitForm.ViewModel)
    func displayDetailChanged(_ viewModel: AstronomyDetailModels.DetailChanged.ViewModel)
    func displayDeepLink(_ viewModel: AstronomyDetailModels.DeepLinking.ViewModel)
}
