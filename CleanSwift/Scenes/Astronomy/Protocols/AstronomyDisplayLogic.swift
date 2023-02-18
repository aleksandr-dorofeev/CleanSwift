// AstronomyDisplayLogic.swift
// Copyright © Aleksandr Dorofeev. All rights reserved.

/// Протокол логики для отображения подготовленной информации на астрономическом экране
protocol AstronomyDisplayLogic: AnyObject {
    func displayAstronomy(_ viewModel: ViewModelAstronomyModel)
}
