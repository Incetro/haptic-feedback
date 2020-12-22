//
//  HeaderView.swift
//  HapticFeedbackExample
//
//  Created by Alexander Lezya on 15.12.2020.
//

import UIKit
import AloeStackView

// MARK: - HeaderView

final class HeaderView: UIView {

    /// Title label
    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "HapticFeedback"
        titleLabel.font = UIFont(name: "SF Pro Rounded", size: 34)
        titleLabel.textColor = .black
        titleLabel.textAlignment = .center
        return titleLabel
    }()

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Layout

extension HeaderView {

    private func setup() {
        setupTitleLabel()
    }

    private func setupTitleLabel() {
        self.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
}
