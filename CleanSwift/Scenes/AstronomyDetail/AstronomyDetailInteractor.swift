// AstronomyDetailInteractor.swift
// Copyright © Aleksandr Dorofeev. All rights reserved.

/// Интерактор экрана деталей
final class AstronomyDetailInteractor: AstronomyDetailBusinessLogic, AstronomyDetailDataStoreProtocol {
    // MARK: - Public properties

    var presenter: AstronomyDetailPresentationLogic?
    var title: String
    var explanation: String

    // MARK: - Initializres

    init(title: String, explanation: String) {
        self.title = title
        self.explanation = explanation
    }

    // MARK: - Public methods

    func requestInitForm(_ request: RequestAstronomyDetailModel) {
        let response = ResponseAstronomyDetailModel(explanation: explanation, title: title)
        presenter?.presentInitForm(response)
    }

    func requestDetailChanged(_ request: RequestChangedAstronomyDetailModel) {
        let response = ResponseChangedAstronomyDetailModel(explanation: explanation)
        presenter?.presentDetailChanged(response)
    }

    func requestDeepLink(_ request: RequestDeepLinkModel) {
        let response = ResponseDeepLinkModel(link: request.link, linkID: request.linkID)
        presenter?.presentDeepLink(response)
    }
}
