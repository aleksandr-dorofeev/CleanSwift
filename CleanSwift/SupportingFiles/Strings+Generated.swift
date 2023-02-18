// Strings+Generated.swift
// Copyright © Aleksandr Dorofeev. All rights reserved.

// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum Constants {
    /// Arial
    internal static let arialFont = Constants.tr("Localizable", "arialFont", fallback: "Arial")
    /// AstronomyDetailTableViewCell
    internal static let astronomyDetailTableCellID = Constants.tr(
        "Localizable",
        "astronomyDetailTableCellID",
        fallback: "AstronomyDetailTableViewCell"
    )
    /// https://go-apod.herokuapp.com/apod
    internal static let astronomyFullUrl = Constants.tr(
        "Localizable",
        "astronomyFullUrl",
        fallback: "https://go-apod.herokuapp.com/apod"
    )
    /// astronomy-picture-of-the-day://
    internal static let astronomyPictureLink = Constants.tr(
        "Localizable",
        "astronomyPictureLink",
        fallback: "astronomy-picture-of-the-day://"
    )
    /// AstronomyTableViewCell
    internal static let astronomyTableCellID = Constants.tr(
        "Localizable",
        "astronomyTableCellID",
        fallback: "AstronomyTableViewCell"
    )
    /// Uppercase
    internal static let changeTextButtonName = Constants.tr(
        "Localizable",
        "changeTextButtonName",
        fallback: "Uppercase"
    )
    /// link
    internal static let deepLinkButtonName = Constants.tr("Localizable", "deepLinkButtonName", fallback: "link")
}

// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension Constants {
    private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
        let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
        return String(format: format, locale: Locale.current, arguments: args)
    }
}

// swiftlint:disable convenience_type
private final class BundleToken {
    static let bundle: Bundle = {
        #if SWIFT_PACKAGE
        return Bundle.module
        #else
        return Bundle(for: BundleToken.self)
        #endif
    }()
}

// swiftlint:enable convenience_type
