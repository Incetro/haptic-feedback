//
//  BigButtonView.swift
//  HapticFeedbackExample
//
//  Created by Alexander Lezya on 16.12.2020.
//

import UIKit
import HapticFeedback

// MARK: - BigButtonView

final class BigButtonView: ExampleStackCell {

    // MARK: - Properties

    /// Appearance instance
    private let appearance: BigButtonViewAppearance

    /// Big button
    private lazy var bigButton: ExampleGradientButton = {
        let bigButton = ExampleGradientButton(appearance: .default)
        bigButton.setTitle("big-button.button".localized(), for: .normal)
        bigButton.isHapticEnabled = true
        return bigButton
    }()

    // MARK: - Initializers

    /// Default initializer
    /// - Parameter appearance: appearance instance
    init(appearance: BigButtonViewAppearance) {
        self.appearance = appearance
        super.init(
            appearance: appearance.exampleStackViewCellAppearance,
            title: "big-button.title".localized()
        )
        setup()
        setupAppearance()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Appearance

extension BigButtonView {

    private func setupAppearance() {
        bigButton.titleLabel?.font = appearance.buttonFont
    }
}

// MARK: - Setup

extension BigButtonView {

    private func setup() {
        setupBigButton()
    }

    private func setupBigButton() {
        addSubview(bigButton)
        bigButton.translatesAutoresizingMaskIntoConstraints = false
        bigButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Constants.topInset).isActive = true
        bigButton.widthAnchor.constraint(equalTo: titleLabel.widthAnchor).isActive = true
        bigButton.leftAnchor.constraint(equalTo: titleLabel.leftAnchor).isActive = true
        bigButton.heightAnchor.constraint(equalToConstant: Constants.bigButtonHeight).isActive = true
        bigButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -Constants.inset).isActive = true
    }
}

// MARK: - Constants

extension BigButtonView {

    enum Constants {
        static let topInset: CGFloat = 32
        static let inset: CGFloat = 72
        static let bigButtonHeight: CGFloat = 84
    }
}
