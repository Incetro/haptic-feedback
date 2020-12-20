//
//  UIButton+HapticFeedback.swift
//  HapticFeedback IOS
//
//  Created by Alexander Lezya on 11.12.2020.
//

import UIKit

// MARK: - HapticFeedbackButton

open class HapticFeedbackButton: UIButton {

    /// Haptic flag
    public var isHapticEnabled = true

    /// Add target to button
    /// - Parameters:
    ///   - frame: frame instance
    public override init(frame: CGRect) {
        super.init(frame: frame)
        addTarget(self, action: #selector(didPress), for: .touchDown)
        addTarget(self, action: #selector(didRelease), for: .touchUpInside)
        addTarget(self, action: #selector(didRelease), for: .touchUpOutside)
    }

    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Hapticable

extension HapticFeedbackButton: Hapticable {

    /// Did press button
    @objc private func didPress() {
        if isHapticEnabled {
            hapticFeedback.generate(.heavy)
        }
    }

    /// Did release button
    @objc private func didRelease() {
        if isHapticEnabled {
            hapticFeedback.generate(.light)
        }
    }
}
