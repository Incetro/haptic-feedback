//
//  HapticFeedbackNotificationEngine.swift
//  HapticFeedback IOS
//
//  Created by Alexander Lezya on 11.12.2020.
//

import UIKit
import DeviceKit

// MARK: - HapticFeedbackNotificationEngine

final class HapticFeedbackNotificationEngine {

    // MARK: - Properties

    /// Log flag
    let logEnabled: Bool

    /// Hapticfeed back generator
    private var generator: UINotificationFeedbackGenerator {
        UINotificationFeedbackGenerator()
    }

    /// Haptic feedback impact generator
    private lazy var impactGenerator: [HapticFeedbackImpactStyle: UIImpactFeedbackGenerator] = [
        .light: .init(style: .light),
        .medium: .init(style: .medium),
        .heavy: .init(style: .heavy),
        .rigid: .init(style: .rigid),
        .soft: .init(style: .soft)
    ]

    // MARK: - Initializers

    /// Default initializer
    /// - Parameter logEnabled: log flag
    init(logEnabled: Bool) {
        self.logEnabled = logEnabled
    }

    // MARK: - Useful

    /// Generate some impact action
    /// - Parameter impact: some impact style
    func generate(_ impact: HapticFeedbackImpactStyle) {
        guard Device.current.hasHapticFeedback else { return }
        impactGenerator[impact]?.impactOccurred()
    }
}

// MARK: - HapticFeedbackEngine

extension HapticFeedbackNotificationEngine: HapticFeedbackEngine {

    /// Prepare for some impact action
    /// - Parameter style: some impact style
    func prepare(_ style: HapticFeedbackImpactStyle) throws {
        guard Device.current.hasHapticFeedback else { throw HapticFeedbackError.notSupportedByDevice }
        impactGenerator[style]?.prepare()
    }

    /// Prepare for some notification
    /// - Parameter notification: some haptic feedback notification
    func prepare(_ notification: HapticFeedbackNotification) throws {
        generator.prepare()
    }

    /// Generate some notification
    /// - Parameter notification: some haptic feedback notification
    func generate(_ notification: HapticFeedbackNotification) {
        guard Device.current.hasHapticFeedback else { return }
        switch notification {
        case .success:
            generator.notificationOccurred(.success)
        case .warning:
            generator.notificationOccurred(.warning)
        case .error:
            generator.notificationOccurred(.error)
        }
    }
}
