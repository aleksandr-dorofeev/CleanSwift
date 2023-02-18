// AstronomyDetailDisplayLogic.swift
// Copyright © Aleksandr Dorofeev. All rights reserved.

/// Протокол логики для отображения подготовленной информации на экране деталей
protocol AstronomyDetailDisplayLogic: AnyObject {
    func displayInitForm(_ viewModel: ViewModelAstronomyDetailModel)
    func displayDetailChanged(_ viewModel: ViewModelChangedAstronomyDetailModel)
    func displayDeepLink(_ viewModel: ViewModelDeepLinkModel)
}
