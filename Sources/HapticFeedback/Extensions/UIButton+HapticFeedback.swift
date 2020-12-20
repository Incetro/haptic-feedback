//
//  UIButton+HapticFeedback.swift
//  HapticFeedback IOS
//
//  Created by Alexander Lezya on 11.12.2020.
//

import UIKit

// MARK: - HapticFeedbackButton

open class HapticFeedbackButton: UIButton {

    /// Add target to button
    /// - Parameter aDecoder: aDecoder instance
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addTarget(self, action: #selector(didPress), for: .touchDown)
        addTarget(self, action: #selector(didRelease), for: .touchUpInside)
        addTarget(self, action: #selector(didRelease), for: .touchUpOutside)
    }
}

// MARK: - Hapticable

extension HapticFeedbackButton: Hapticable {

    /// Did press button
    @objc private func didPress() {
        hapticFeedback.generate(.heavy)
    }

    /// Did release button
    @objc private func didRelease() {
        hapticFeedback.generate(.light)
    }
}
