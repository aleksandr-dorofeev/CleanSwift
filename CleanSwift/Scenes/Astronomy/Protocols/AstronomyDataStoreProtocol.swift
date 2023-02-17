// AstronomyDataStoreProtocol.swift
// Copyright © Aleksandr Dorofeev. All rights reserved.

import Foundation

/// Протокол передачи данных
protocol AstronomyDataStoreProtocol {
    var title: String? { get }
    var explanation: String? { get set }
}
