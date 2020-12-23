//
//  ImpactButtonsView.swift
//  HapticFeedbackExample
//
//  Created by Alexander Lezya on 15.12.2020.
//

import UIKit
import HapticFeedback

// MARK: - ImpactButtonsView

final class ImpactButtonsView: ExampleStackCell {

    // MARK: - Properties

    /// Delegate
    weak var delegate: ImpactButtonsViewDelegate?

    /// Appearance instance
    private let appearance: ExampleStackViewCellAppearance

    /// Stack view
    private let stackView = UIStackView()

    /// Left stackView
    private let leftStackView = UIStackView()

    /// Right stackView
    private let rightStackView = UIStackView()

    // MARK: - Initializers

    /// Default initializer
    /// - Parameter appearance: appearance instance
    init(appearance: ExampleStackViewCellAppearance) {
        self.appearance = appearance
        super.init(appearance: appearance, title: "impact-buttons.title".localized())
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Layout

extension ImpactButtonsView {

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
        stackView.spacing = Constants.stackViewSpacing
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Constants.verticalInset).isActive = true
        stackView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: Constants.horizontalInset).isActive = true
        stackView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -Constants.horizontalInset).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -Constants.bottomInset).isActive = true
    }

    private func setupLeftStackView() {
        leftStackView.axis = .vertical
        leftStackView.spacing = Constants.subStackViewSpacing
        leftStackView.distribution = .equalSpacing
        stackView.addArrangedSubview(leftStackView)
    }

    private func setupRightStackView() {
        rightStackView.axis = .vertical
        rightStackView.spacing = Constants.subStackViewSpacing
        rightStackView.distribution = .equalSpacing
        stackView.addArrangedSubview(rightStackView)
    }

    private func setupLeftButtons() {
        let impacts: [HapticFeedbackNotification] = [.success, .error, .warning]
        let titles = ["success", "error", "warning"]
        for (title, impact) in zip(titles, impacts) {
            let button = ExampleGradientButton(appearance: .default)
            button.setTitle(title.localized(), for: .normal)
            button.widthAnchor.constraint(equalTo: button.heightAnchor).isActive = true
            button.addAction(UIAction(handler: { _ in self.impactAction(impact: impact) }), for: .touchUpInside)
            leftStackView.addArrangedSubview(button)
        }
    }

    private func setupRightButtons() {
        let impacts: [HapticFeedbackNotification] = [.success, .error, .warning]
        let titles = ["success-alert", "error-alert", "warning-alert"]
        for (title, impact) in zip(titles, impacts) {
            let button = ExampleGradientButton(appearance: .default)
            button.setTitle(title.localized(), for: .normal)
            button.widthAnchor.constraint(equalTo: button.heightAnchor).isActive = true
            button.addAction(UIAction(handler: { _ in self.alertAction(impact: impact, title: title) }), for: .touchUpInside)
            rightStackView.addArrangedSubview(button)
        }
    }
}

// MARK: - Hapticable

extension ImpactButtonsView: Hapticable {

    private func impactAction(impact: HapticFeedbackNotification) {
        hapticFeedback.generate(impact)
    }

    private func alertAction(impact: HapticFeedbackNotification, title: String) {
        delegate?.alertButtonTapped(title: title, notification: impact)
    }
}

// MARK: - Constants

extension ImpactButtonsView {
    
    enum Constants {
        static let horizontalInset: CGFloat = 48
        static let verticalInset: CGFloat = 44
        static let stackViewSpacing: CGFloat = 40
        static let subStackViewSpacing: CGFloat = 44
        static let bottomInset: CGFloat = 72
    }
}
