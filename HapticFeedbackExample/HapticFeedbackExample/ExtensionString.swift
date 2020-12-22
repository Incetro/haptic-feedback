//
//  ExtensionString.swift
//  HapticFeedbackExample
//
//  Created by Alexander Lezya on 18.12.2020.
//

import Foundation

// MARK: - Localization

extension String {

    func localized() -> String {
       NSLocalizedString(
        self,
        tableName: "Localizable",
        bundle: .main,
        value: self,
        comment: self
       )
    }
}
