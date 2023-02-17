// AstronomyDetailInteractor.swift
// Copyright © Aleksandr Dorofeev. All rights reserved.

import Foundation

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

    func requestInitForm(_ request: AstronomyDetailModels.InitForm.Request) {
        let response = AstronomyDetailModels.InitForm.Response(explanation: explanation, title: title)
        presenter?.presentInitForm(response)
    }

    func requestDetailChanged(_ request: AstronomyDetailModels.DetailChanged.Request) {
        let response = AstronomyDetailModels.DetailChanged.Response(explanation: explanation)
        presenter?.presentDetailChanged(response)
    }

    func requestDeepLink(_ request: AstronomyDetailModels.DeepLinking.Request) {
        let response = AstronomyDetailModels.DeepLinking.Response(link: request.link, linkID: request.linkID)
        presenter?.presentDeepLink(response)
    }
}
