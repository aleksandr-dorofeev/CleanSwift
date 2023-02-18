// AstronomyDetailPresenter.swift
// Copyright © Aleksandr Dorofeev. All rights reserved.

import Foundation

/// Презентер для экрана деталей
final class AstronomyDetailPresenter: AstronomyDetailPresentationLogic {
    // MARK: - Public properties

    weak var view: AstronomyDetailDisplayLogic?

    // MARK: - Public methods

    func presentInitForm(_ response: ResponseAstronomyDetailModel) {
        let viewModel = ViewModelAstronomyDetailModel(
            explanation: response.explanation,
            title: response.title
        )
        view?.displayInitForm(viewModel)
    }

    func presentDetailChanged(_ response: ResponseChangedAstronomyDetailModel) {
        let viewModel = ViewModelChangedAstronomyDetailModel(
            explanation: response.explanation.uppercased()
        )
        view?.displayDetailChanged(viewModel)
    }

    func presentDeepLink(_ response: ResponseDeepLinkModel) {
        guard let url = URL(string: response.link) else { return }
        let viewModel = ViewModelDeepLinkModel(link: url, linkID: response.linkID)
        view?.displayDeepLink(viewModel)
    }
}
