// AstronomyPresenter.swift
// Copyright © Aleksandr Dorofeev. All rights reserved.

import Foundation

/// Презентер для экрана с астрономической информацией
final class AstronomyPresenter: AstronomyPresentationLogic {
    // MARK: - Public properties

    weak var view: AstronomyDisplayLogic?

    // MARK: - Public methods

    func presentAstronomy(_ response: AstronomyModels.InitForm.Response) {
        let viewModel = AstronomyModels.InitForm.ViewModel(
            title: response.title,
            explanation: response.explanation,
            data: response.data
        )
        view?.displayAstronomy(viewModel)
    }
}
