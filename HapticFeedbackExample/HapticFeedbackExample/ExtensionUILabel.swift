//
//  ExtensionUILabel.swift
//  HapticFeedbackExample
//
//  Created by Alexander Lezya on 17.12.2020.
//

import UIKit

// MARK: - UILabel

extension UILabel {

    func addCharacterSpacing(kernValue: Double = 0.38) {
        if let labelText = text, !labelText.isEmpty {
            let attributedString = NSMutableAttributedString(string: labelText)
            attributedString.addAttribute(
                .kern,
                value: kernValue,
                range: NSRange(location: 0, length: attributedString.length - 1)
            )
            attributedText = attributedString
        }
    }
}
