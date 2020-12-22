//
//  ShadowButtonAppearance.swift
//  HapticFeedbackExample
//
//  Created by Alexander Lezya on 18.12.2020.
//

import UIKit

// MARK: - ShadowButtonAppearance

struct ShadowButtonAppearance {
    let shadowColor: CGColor
    let titleFont: UIFont

    static var `default`: ShadowButtonAppearance {
        .init(
            shadowColor: UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor,
            titleFont: UIFont(name: "SF Pro Rounded", size: 20) ?? UIFont.systemFont(ofSize: 20)
        )
    }

    // MARK: - Initializers

    init(shadowColor: CGColor, titleFont: UIFont) {
        self.shadowColor = shadowColor
        self.titleFont = titleFont
    }

     init(titleFont: UIFont) {
        self.init(shadowColor: UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor, titleFont: titleFont)
    }
}
