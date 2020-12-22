//
//  PatternViewAppearance.swift
//  HapticFeedbackExample
//
//  Created by Alexander Lezya on 18.12.2020.
//

import UIKit

// MARK: - PatternViewAppearance

struct PatternViewAppearance {
    let exampleStackViewCellAppearance: ExampleStackViewCellAppearance
    let playButtonAppearance: GradientButtonAppearance
    let cancelButtonAppearance: ShadowButtonAppearance
    let patternButtonAppearance: ShadowButtonAppearance
    let patternTitleFont: UIFont
    let titleTextColor: UIColor

    static var `default`: PatternViewAppearance {
        .init(
            exampleStackViewCellAppearance: .default,
            playButtonAppearance: GradientButtonAppearance(
                shadowButtonAppearance: .init(titleFont: UIFont(name: "SF Pro Rounded", size: 30) ?? UIFont.systemFont(ofSize: 30)),
                gradientColors: GradientButtonAppearance.default.gradientColors
            ),
            cancelButtonAppearance: ShadowButtonAppearance(titleFont: UIFont(name: "SF Pro Rounded", size: 30) ?? UIFont.systemFont(ofSize: 30)),
            patternButtonAppearance: ShadowButtonAppearance(titleFont: UIFont(name: "SF Pro Rounded", size: 30) ?? UIFont.systemFont(ofSize: 30)),
            patternTitleFont: UIFont(name: "SF Pro Rounded", size: 30) ?? UIFont.systemFont(ofSize: 30),
            titleTextColor: .black
        )
    }
}
