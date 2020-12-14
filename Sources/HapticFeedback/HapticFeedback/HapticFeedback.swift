//
//  HapticFeedback.swift
//  HapticFeedback
//
//  Created by Alexander Lezya on 11.12.2020.
//

import UIKit
import DeviceKit

// MARK: - HapticFeedback

public final class HapticFeedback {

    // MARK: - Properties

    /// Haptic feedback engine
    private var engine: HapticFeedbackEngine? {
        let currentDevice = Device.current
        var engine: HapticFeedbackEngine?
        if currentDevice.hasHapticFeedback {
            engine = HapticFeedbackNotificationEngine(logEnabled: logEnabled)
        } else if currentDevice.hasTapticEngine {
            engine = TapticEngine(logEnabled: logEnabled)
        } else {
            engine = nil
        }
        return engine
    }

    /// Selection generator isntance
    private lazy var selectionGenerator = UISelectionFeedbackGenerator()

    /// Pattern engine
    private var patternEngine: PatternEngine?

    /// Log flag
    private let logEnabled = true

    // MARK: - Initializers

    public init() { }

    // MARK: - Useful

    /// Tap feedback
    public func tap() {
        selectionGenerator.selectionChanged()
    }

    /// Prepare device for some impact action
    public func prepare(_ style: HapticFeedbackImpactStyle) throws {
        guard let engine = engine else {
            if logEnabled {
                print("HapticFeedback 📳: Device name - \(Device.current)")
            }
            throw HapticFeedbackError.notSupported
        }
        try engine.prepare(style)
    }

    /// Prepare device for some notification
    public func prepare(_ notification: HapticFeedbackNotification) throws {
        try engine?.prepare(notification)
    }

    /// Generate some notification
    /// - Parameter notification: some haptic feedback notification
    public func generate(_ notification: HapticFeedbackNotification) {
        engine?.generate(notification)
    }

    /// Generate some impact action
    /// - Parameter impact: some impact style
    public func generate(_ impact: HapticFeedbackImpactStyle) {
        guard let engine = self.engine as? HapticFeedbackNotificationEngine else { return }
        engine.generate(impact)
    }

    /// Generate custom pattern
    /// - Parameters:
    ///   - pattern: custom pattern
    ///   - delay: custom delay
    public func generate(_ pattern: String, delay: Double) {
        guard let engine = self.engine as? HapticFeedbackNotificationEngine else { return }
        patternEngine = PatternEngine(hapticEngine: engine, pattern: HapticFeedbackPattern(pattern: pattern, delay: delay))
        guard let patternEngine = self.patternEngine, patternEngine.isFinished else { return }
        patternEngine.generate()
    }
}
