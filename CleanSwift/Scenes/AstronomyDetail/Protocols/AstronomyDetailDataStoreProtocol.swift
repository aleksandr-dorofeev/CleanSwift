// AstronomyDetailDataStoreProtocol.swift
// Copyright © Aleksandr Dorofeev. All rights reserved.

import Foundation

/// Протокол передачи данных
protocol AstronomyDetailDataStoreProtocol {
    var title: String { get }
    var explanation: String { get set }
}
