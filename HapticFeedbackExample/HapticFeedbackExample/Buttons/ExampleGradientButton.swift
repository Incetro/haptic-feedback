//
//  ExampleGradientButton.swift
//  HapticFeedbackExample
//
//  Created by Alexander Lezya on 14.12.2020.
//

import UIKit
import HapticFeedback

// MARK: - ExampleGradientButton

class ExampleGradientButton: ExampleShadowButton {

    /// Appearance instance
    private let appearance: GradientButtonAppearance

    /// Gradient layer
    private lazy var gradientLayer: CAGradientLayer = {
        let gradientLayer = CAGradientLayer()
        gradientLayer.startPoint = Constants.startPoint
        gradientLayer.endPoint = Constants.endPoint
        gradientLayer.locations = Constants.locations
        gradientLayer.shadowOffset = Constants.shadowOffset
        gradientLayer.shadowRadius = Constants.shadowRadius
        gradientLayer.shadowOpacity = Constants.shadowOpacity
        return gradientLayer
    }()

    // MARK: - Initializers

    /// Default Initializer
    /// - Parameter appearance: appearance instance
    init(appearance: GradientButtonAppearance) {
        self.appearance = appearance
        super.init(appearance: appearance.shadowButtonAppearance)
        setupAppearance()
        layer.insertSublayer(gradientLayer, at: 0)
        isHapticEnabled = false
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Overrides

    public override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }
}

// MARK: - Appearance

extension ExampleGradientButton {

    private func setupAppearance() {
        gradientLayer.colors = appearance.gradientColors
        gradientLayer.shadowColor = appearance.shadowButtonAppearance.shadowColor
    }
}

// MARK: - Constants

private enum Constants {
    static let cornerRadius: CGFloat = 21
    static let shadowRadius: CGFloat = 20
    static let shadowOpacity: Float = 1
    static let startPoint = CGPoint(x: 0, y: 0)
    static let endPoint = CGPoint(x: 1, y: 0)
    static let shadowOffset = CGSize(width: 0, height: 0)
    static let locations: [NSNumber] = [0, 1]
}
