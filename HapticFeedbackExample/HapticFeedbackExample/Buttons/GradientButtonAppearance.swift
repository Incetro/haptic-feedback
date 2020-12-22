//
//  GradientButtonAppearance.swift
//  HapticFeedbackExample
//
//  Created by Alexander Lezya on 14.12.2020.
//

import UIKit

// MARK: - GradientButtonAppearance

struct GradientButtonAppearance {
    let shadowButtonAppearance: ShadowButtonAppearance
    let gradientColors: [CGColor]

    static var `default`: GradientButtonAppearance {
        .init(
            shadowButtonAppearance: .default,
            gradientColors: [
                UIColor(red: 0.02, green: 0.678, blue: 0.984, alpha: 1).cgColor,
                UIColor(red: 0.016, green: 0.435, blue: 1, alpha: 1).cgColor
            ]
        )
    }

    // MARK: - Initializers

    init(shadowButtonAppearance: ShadowButtonAppearance, gradientColors: [CGColor]) {
        self.shadowButtonAppearance = shadowButtonAppearance
        self.gradientColors = gradientColors
    }

    init(shadowButtonAppearance: ShadowButtonAppearance) {
        self.init(
            shadowButtonAppearance: shadowButtonAppearance,
            gradientColors: [
                UIColor(red: 0.02, green: 0.678, blue: 0.984, alpha: 1).cgColor,
                UIColor(red: 0.016, green: 0.435, blue: 1, alpha: 1).cgColor
            ])
    }
}
