//
//  ExampleStackCell.swift
//  HapticFeedbackExample
//
//  Created by Alexander Lezya on 16.12.2020.
//

import UIKit

// MARK: - ExampleStackCell

 class ExampleStackCell: UIView {

    /// Appearance instance
    private let appearance: ExampleStackViewCellAppearance

    /// Title label
    let titleLabel = UILabel()

    // MARK: - Initializers

    /// Default inititalizers
    /// - Parameter appearance: appearance instance
    init(appearance: ExampleStackViewCellAppearance, title: String) {
        self.appearance = appearance
        titleLabel.text = title
        titleLabel.addCharacterSpacing()
        super.init(frame: .zero)
        setup()
        setupAppearance()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Layout

extension ExampleStackCell {

    private func setup() {
        setupTitleLabel()
    }

    private func setupTitleLabel() {
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: LayoutConstants.horizontalInset).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -LayoutConstants.horizontalInset).isActive = true
    }
}

// MARK: - Appearance

extension ExampleStackCell {

    private func setupAppearance() {
        titleLabel.font = appearance.textFont
        titleLabel.textColor = appearance.textColor
        titleLabel.numberOfLines = 0
    }
}

// MARK: - LayoutConstants

private enum LayoutConstants {
    static let horizontalInset: CGFloat = 42
}
