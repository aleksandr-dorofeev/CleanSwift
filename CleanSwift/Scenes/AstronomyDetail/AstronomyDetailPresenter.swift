// AstronomyDetailPresenter.swift
// Copyright © Aleksandr Dorofeev. All rights reserved.

import Foundation

/// Презентер для экрана деталей
final class AstronomyDetailPresenter: AstronomyDetailPresentationLogic {
    // MARK: - Public properties

    weak var view: AstronomyDetailDisplayLogic?

    // MARK: - Public methods

    func presentInitForm(_ response: AstronomyDetailModels.InitForm.Response) {
        let viewModel = AstronomyDetailModels.InitForm.ViewModel(
            explanation: response.explanation,
            title: response.title
        )
        view?.displayInitForm(viewModel)
    }

    func presentDetailChanged(_ response: AstronomyDetailModels.DetailChanged.Response) {
        let viewModel = AstronomyDetailModels.DetailChanged.ViewModel(
            explanation: response.explanation.uppercased()
        )
        view?.displayDetailChanged(viewModel)
    }

    func presentDeepLink(_ response: AstronomyDetailModels.DeepLinking.Response) {
        guard let url = URL(string: response.link) else { return }
        let viewModel = AstronomyDetailModels.DeepLinking.ViewModel(link: url, linkID: response.linkID)
        view?.displayDeepLink(viewModel)
    }
}
