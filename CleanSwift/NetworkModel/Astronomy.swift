// Astronomy.swift
// Copyright © Aleksandr Dorofeev. All rights reserved.

/// Структура астрономического запроса
struct Astronomy: Decodable {
    /// Описание созвездия
    let explanation: String
    /// Наименование
    let title: String
    /// Ссылка на изображение
    let url: String
}
