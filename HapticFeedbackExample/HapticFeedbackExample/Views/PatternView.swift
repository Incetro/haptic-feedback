//
//  PatternView.swift
//  HapticFeedbackExample
//
//  Created by Alexander Lezya on 16.12.2020.
//

import UIKit
import HapticFeedback

// MARK: - ExampleStackCell

final class PatternView: ExampleStackCell {

    // MARK: - Properties

    /// Delegate
    weak var delegate: PatternViewDelegate?

    /// Appearance instance
    private let appearance: PatternViewAppearance

    /// First stack view
    private let firstStackView = UIStackView()

    /// Second stack view
    private let secondStackView = UIStackView()

    /// Pattern label
    private lazy var patternLabel: UILabel = {
        let patternLabel = UILabel()
        patternLabel.text = "..oO-Oo.."
        patternLabel.textAlignment = .center
        patternLabel.numberOfLines = 0
        return patternLabel
    }()

    /// Cancel button
    private lazy var cancelButton: ExampleShadowButton = {
        let cancelButton = ExampleShadowButton(appearance: appearance.cancelButtonAppearance)
        cancelButton.setTitle("❌", for: .normal)
        return cancelButton
    }()

    /// Play button
    private lazy var playButton: ExampleGradientButton = {
        let playButton = ExampleGradientButton(appearance: appearance.playButtonAppearance)
        playButton.setTitle("▶️", for: .normal)
        return playButton
    }()

    // MARK: - Initializers

    /// Default initializer
    /// - Parameter appearance: appearance instance
    init(appearance: PatternViewAppearance) {
        self.appearance = appearance
        super.init(
            appearance: appearance.exampleStackViewCellAppearance, title: "pattern.head-title".localized()
        )
        setup()
        setupAppearance()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Appearance

extension PatternView {

    private func setupAppearance() {
        patternLabel.font = appearance.patternTitleFont
        patternLabel.textColor = appearance.titleTextColor
    }
}

// MARK: - Setup

extension PatternView {

    private func setup() {
        setupPatternLabel()
        setupFirstStackView()
        setupButtons()
        setupSecondStackView()
        setupCancelButton()
        setupPlayButton()

    }

    private func setupPatternLabel() {
        addSubview(patternLabel)
        patternLabel.translatesAutoresizingMaskIntoConstraints = false
        patternLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Constants.verticalInset).isActive = true
        patternLabel.heightAnchor.constraint(equalToConstant: Constants.patternLabelHeight).isActive = true
        patternLabel.leftAnchor.constraint(equalTo: titleLabel.leftAnchor).isActive = true
        patternLabel.rightAnchor.constraint(equalTo: titleLabel.rightAnchor).isActive = true
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(deleteLastChar))
        swipeLeft.direction = .left
        patternLabel.addGestureRecognizer(swipeLeft)
        patternLabel.isUserInteractionEnabled = true
    }

    private func setupFirstStackView() {
        firstStackView.axis = .horizontal
        firstStackView.spacing = Constants.firstStackViewSpacing
        firstStackView.distribution = .fillEqually
        addSubview(firstStackView)
        firstStackView.translatesAutoresizingMaskIntoConstraints = false
        firstStackView.topAnchor.constraint(equalTo: patternLabel.bottomAnchor, constant: Constants.verticalInset).isActive = true
        firstStackView.widthAnchor.constraint(equalTo: titleLabel.widthAnchor).isActive = true
        firstStackView.leftAnchor.constraint(equalTo: titleLabel.leftAnchor).isActive = true
    }

    private func setupButtons() {
        for symbol in [".", "-", "o", "O"] {
            let button = ExampleShadowButton(appearance: appearance.patternButtonAppearance)
            button.setTitle(symbol, for: .normal)
            button.setTitleColor(.black, for: .normal)
            button.addTarget(self, action: #selector(inputAction(sender:)), for: .touchUpInside)
            firstStackView.addArrangedSubview(button)
            button.widthAnchor.constraint(equalTo: button.heightAnchor).isActive = true
        }
    }

    private func setupSecondStackView() {
        secondStackView.axis = .horizontal
        secondStackView.spacing = Constants.secondStackViewSpacing
        firstStackView.distribution = .fillEqually
        addSubview(secondStackView)
        secondStackView.translatesAutoresizingMaskIntoConstraints = false
        secondStackView.topAnchor.constraint(equalTo: firstStackView.bottomAnchor, constant: Constants.verticalInset).isActive = true
        secondStackView.leftAnchor.constraint(equalTo: titleLabel.leftAnchor, constant: Constants.horizontalInset).isActive = true
        secondStackView.rightAnchor.constraint(equalTo: titleLabel.rightAnchor, constant: -Constants.horizontalInset).isActive = true
        secondStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -Constants.verticalInset).isActive = true
    }

    private func setupCancelButton() {
        secondStackView.addArrangedSubview(cancelButton)
        cancelButton.widthAnchor.constraint(equalTo: cancelButton.heightAnchor).isActive = true
        cancelButton.addTarget(self, action: #selector(clearAction), for: .touchUpInside)
    }

    private func setupPlayButton() {
        secondStackView.addArrangedSubview(playButton)
        playButton.widthAnchor.constraint(equalTo: playButton.heightAnchor).isActive = true
        playButton.addTarget(self, action: #selector(playAction), for: .touchUpInside)
    }
}

// MARK: - Actions

extension PatternView: Hapticable {

    @objc private func inputAction(sender: UIButton) {
        guard patternLabel.text?.count ?? 0 <= 45 else { return }
        if patternLabel.text == "pattern.title".localized() {
            patternLabel.text = ""
        }
        patternLabel.text?.append(sender.titleLabel?.text ?? "")
        if patternLabel.textColor == .gray {
            patternLabel.textColor = appearance.titleTextColor
            patternLabel.font = appearance.patternTitleFont
        }
        playButton.isEnabled = true
        delegate?.didChangePatternView()
    }

    @objc private func clearAction() {
        patternLabel.text = "pattern.title".localized()
        patternLabel.font = UIFont(name: "SF Pro Rounded", size: 19) ?? UIFont.systemFont(ofSize: 19)
        patternLabel.textColor = .gray
        playButton.isEnabled = false
    }

    @objc private func playAction() {
        hapticFeedback.generate(patternLabel.text ?? "", delay: 0.1)
    }

    @objc private func deleteLastChar() {
        patternLabel.text?.removeLast()
    }
}

// MARK: - Constants

extension PatternView {

    enum Constants {
        static let verticalInset: CGFloat = 32
        static let horizontalInset: CGFloat = 34
        static let patternLabelHeight: CGFloat = 180
        static let firstStackViewSpacing: CGFloat = 8
        static let secondStackViewSpacing: CGFloat = 16
    }
}
