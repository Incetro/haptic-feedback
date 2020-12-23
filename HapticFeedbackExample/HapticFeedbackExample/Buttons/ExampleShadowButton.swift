//
//  ExampleShadowButton.swift
//  HapticFeedbackExample
//
//  Created by Alexander Lezya on 15.12.2020.
//

import UIKit

// MARK: - ExampleShadowButton

class ExampleShadowButton: ExampleRoundedButton {

    // MARK: - Properties

    /// Appearance instance
    private let appearance: ShadowButtonAppearance

    // MARK: - Initializers

    /// Default Initializer
    init(appearance: ShadowButtonAppearance) {
        self.appearance = appearance
        super.init(frame: .zero)
        backgroundColor = .white
        setupAppearance()
        setupTitleLabel()
        isHapticEnabled = false
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    /// Shadow layer
    private var shadowLayer: CALayer?


    // MARK: - Overrides

    override func layoutSubviews() {
        super.layoutSubviews()
        if frame != .zero {
            updateLayerProperties()
        }
    }

    // MARK: - Private

    private func updateLayerProperties() {
        shadowLayer?.removeFromSuperlayer()
        let shadowPath = UIBezierPath(
            roundedRect: frame,
            byRoundingCorners: .allCorners,
            cornerRadii: CGSize(width: Constants.cornerRadius, height: Constants.cornerRadius)
        )
        let shadowFrame = frame
            .insetBy(dx: -2 * Constants.shadowRadius, dy: -2 * Constants.shadowRadius)
            .offsetBy(dx: Constants.xOffset, dy: Constants.yOffset)
        let shadowRect = CGRect(origin: .zero, size: shadowFrame.size)
        let shadowTransform = CGAffineTransform(
            translationX: -frame.origin.x - Constants.xOffset + 2 * Constants.shadowRadius,
            y: -frame.origin.y - Constants.yOffset + 2 * Constants.shadowRadius
        )
        let shadowLayer = CALayer()
        shadowLayer.shadowOffset = Constants.shadowOffset
        shadowLayer.shadowOpacity = Constants.shadowOpacity
        shadowLayer.shadowRadius = Constants.shadowRadius
        shadowLayer.shadowPath = shadowPath.cgPath
        shadowLayer.shadowColor = appearance.shadowColor
        let mutablePath = CGMutablePath()
        mutablePath.addRect(shadowRect)
        mutablePath.addPath(shadowLayer.shadowPath!, transform: shadowTransform)
        mutablePath.closeSubpath()
        let maskLayer = CAShapeLayer()
        maskLayer.frame = shadowFrame
        maskLayer.fillRule = .evenOdd
        maskLayer.path = mutablePath

        shadowLayer.mask = maskLayer
        layer.superlayer?.insertSublayer(shadowLayer, below: layer)
        self.shadowLayer = shadowLayer
    }

    private func setupTitleLabel() {
        titleLabel?.numberOfLines = 0
        titleLabel?.textAlignment = .center
    }
}

// MARK: - Appearance

extension ExampleShadowButton {

    private func setupAppearance() {
        titleLabel?.font = appearance.titleFont
    }
}

// MARK: - Constants

extension ExampleShadowButton {

    enum Constants {
        static let cornerRadius: CGFloat = 21
        static let shadowRadius: CGFloat = 20
        static let shadowOpacity: Float = 1
        static let shadowOffset = CGSize(width: 4, height: 6)
        static let xOffset: CGFloat = 4
        static let yOffset: CGFloat = 6
    }
}
