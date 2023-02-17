// AstronomyDetailModels.swift
// Copyright © Aleksandr Dorofeev. All rights reserved.

import Foundation

/// Модель для передачи данных в VIP цикле
enum AstronomyDetailModels {
    enum InitForm {
        struct Request {}
        struct Response {
            let explanation: String
            let title: String
        }

        struct ViewModel {
            let explanation: String
            let title: String
        }
    }

    enum DetailChanged {
        struct Request {
            let explanation: String
        }

        struct Response {
            let explanation: String
        }

        struct ViewModel {
            let explanation: String
        }
    }

    enum DeepLinking {
        struct Request {
            let link: String
            let linkID: Int
        }

        struct Response {
            let link: String
            let linkID: Int
        }

        struct ViewModel {
            let link: URL
            let linkID: Int
        }
    }
}
