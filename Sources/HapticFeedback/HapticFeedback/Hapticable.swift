//
//  Hapticable.swift
//  HapticFeedback IOS
//
//  Created by Alexander Lezya on 13.12.2020.
//

import Foundation

// MARK: - Hapticable

public protocol Hapticable {

    /// Haptic feedback instance
    var hapticFeedback: HapticFeedback { get }

    /// Generate error feedback
    func error()

    /// Generate success feedback
    func success()

    /// Generate warning feedback
    func warning()

    /// Tap feedback
    func tap()

    /// Generate some impact feedback
    func impact(_ style: HapticFeedbackImpactStyle)
}

// MARK: - Default implementation

extension Hapticable {

    public var hapticFeedback: HapticFeedback {
        HapticFeedback()
    }

    public func error() {
        hapticFeedback.generate(.error)
    }

    public func success() {
        hapticFeedback.generate(.success)
    }

    public func warning() {
        hapticFeedback.generate(.warning)
    }

    public func tap() {
        hapticFeedback.tap()
    }

    public func impact(_ style: HapticFeedbackImpactStyle) {
        hapticFeedback.generate(style)
    }
}
