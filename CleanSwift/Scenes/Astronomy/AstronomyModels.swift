// AstronomyModels.swift
// Copyright © Aleksandr Dorofeev. All rights reserved.

import Foundation

/// Модель для передачи данных в VIP цикле
enum AstronomyModels {
    enum InitForm {
        struct Request {}
        struct Response {
            var title: String
            var explanation: String
            var data: Data
        }

        struct ViewModel {
            let title: String
            let explanation: String
            let data: Data
        }
    }
}
