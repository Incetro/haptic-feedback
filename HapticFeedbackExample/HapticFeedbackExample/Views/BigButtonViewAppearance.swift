//
//  BigButtonViewAppearance.swift
//  HapticFeedbackExample
//
//  Created by Alexander Lezya on 18.12.2020.
//

import UIKit

// MARK: - BigButtonViewAppearance

struct BigButtonViewAppearance {
    let exampleStackViewCellAppearance: ExampleStackViewCellAppearance
    let bigButtonAppearance: GradientButtonAppearance
    let buttonFont: UIFont

    static var `default`: BigButtonViewAppearance {
        .init(
            exampleStackViewCellAppearance: .default,
            bigButtonAppearance: GradientButtonAppearance(
                shadowButtonAppearance: .init(titleFont: UIFont(name: "SF Pro Rounded", size: 30) ?? UIFont.systemFont(ofSize: 30)),
                gradientColors: GradientButtonAppearance.default.gradientColors
            ),
            buttonFont: UIFont(name: "SF Pro Rounded", size: 30) ?? UIFont.systemFont(ofSize: 30)
        )
    }
}
