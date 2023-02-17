// Astronomy.swift
// Copyright © Aleksandr Dorofeev. All rights reserved.

import Foundation

/// Структура астрономического запроса
struct Astronomy: Decodable {
    let copyright: String
    let date: String
    let explanation: String
    let hdurl: String
    let title: String
    let url: String

    enum CodingKeys: String, CodingKey {
        case copyright
        case date
        case explanation
        case hdurl
        case title, url
    }
}
