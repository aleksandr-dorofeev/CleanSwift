// AstronomyPresenter.swift
// Copyright © Aleksandr Dorofeev. All rights reserved.

/// Презентер для экрана с астрономической информацией
final class AstronomyPresenter: AstronomyPresentationLogic {
    // MARK: - Public properties

    weak var view: AstronomyDisplayLogic?

    // MARK: - Public methods

    func presentAstronomy(_ response: ResponseAstronomyModel) {
        let viewModel = ViewModelAstronomyModel(
            title: response.title,
            explanation: response.explanation,
            data: response.data
        )
        view?.displayAstronomy(viewModel)
    }
}
