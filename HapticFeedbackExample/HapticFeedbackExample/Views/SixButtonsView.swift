//
//  SixButtonsView.swift
//  HapticFeedbackExample
//
//  Created by Alexander Lezya on 15.12.2020.
//

import UIKit
import HapticFeedback

// MARK: - SixButtonsView

final class SixButtonsView: ExampleStackCell {

    /// Delegate
    weak var delegate: SixButtonsViewDelegate?

    /// Appearance instance
    private let appearance: ExampleStackViewCellAppearance

    /// Stack view
    private var stackView = UIStackView()

    /// Left stackView
    private var leftStackView = UIStackView()

    /// Right stackView
    private var rightStackView = UIStackView()

    // MARK: - Initializers

    /// Default initializer
    /// - Parameter appearance: appearance instance
    init(appearance: ExampleStackViewCellAppearance) {
        self.appearance = appearance
        super.init(appearance: appearance, title: "SixButtonsTitle".localized())
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Layout

extension SixButtonsView {

    private func setup() {
        setupStackView()
        setupLeftStackView()
        setupRightStackView()
        setupLeftButtons()
        setupRightButtons()
    }

    private func setupStackView() {
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 40
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: LayoutConstants.verticalInset).isActive = true
        stackView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: LayoutConstants.horizontalInset).isActive = true
        stackView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -LayoutConstants.horizontalInset).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -72).isActive = true
    }

    private func setupLeftStackView() {
        leftStackView.axis = .vertical
        leftStackView.spacing = 44
        leftStackView.distribution = .equalSpacing
        stackView.addArrangedSubview(leftStackView)
    }

    private func setupRightStackView() {
        rightStackView.axis = .vertical
        rightStackView.spacing = 44
        rightStackView.distribution = .equalSpacing
        stackView.addArrangedSubview(rightStackView)
    }

    private func setupLeftButtons() {
        let impacts: [HapticFeedbackNotification] = [.success, .error, .warning]
        for (index, title) in [
            "Success",
            "Error",
            "Warning"
        ].enumerated() {
            let button = ExampleGradientButton(appearance: .default)
            button.setTitle(title.localized(), for: .normal)
            button.widthAnchor.constraint(equalTo: button.heightAnchor).isActive = true
            button.addAction(UIAction(handler: { _ in self.impactAction(impact: impacts[index]) }), for: .touchUpInside)
            leftStackView.addArrangedSubview(button)
        }
    }

    private func setupRightButtons() {
        let impacts: [HapticFeedbackNotification] = [.success, .error, .warning]
        for (index, title) in [
            "Success alert",
            "Error alert",
            "Warning alert"
        ].enumerated() {
            let button = ExampleGradientButton(appearance: .default)
            button.setTitle(title.localized(), for: .normal)
            button.widthAnchor.constraint(equalTo: button.heightAnchor).isActive = true
            button.addAction(UIAction(handler: { _ in self.alertAction(impact: impacts[index], title: title) }), for: .touchUpInside)
            rightStackView.addArrangedSubview(button)
        }
    }
}

// MARK: - Hapticable

extension SixButtonsView: Hapticable {

    private func impactAction(impact: HapticFeedbackNotification) {
        hapticFeedback.generate(impact)
    }

    private func alertAction(impact: HapticFeedbackNotification, title: String) {
        delegate?.alertButtonTapped(title: title, notification: impact)
    }
}

// MARK: - LayoutConstants

private enum LayoutConstants {
    static let horizontalInset: CGFloat = 48
    static let verticalInset: CGFloat = 44
}
