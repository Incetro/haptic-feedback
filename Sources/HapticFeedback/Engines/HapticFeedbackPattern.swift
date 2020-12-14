//
//  HapticFeedbackPattern.swift
//  HapticFeedback IOS
//
//  Created by Alexander Lezya on 11.12.2020.
//

import Foundation

// MARK: - HapticFeedbackPattern

public class HapticFeedbackPattern {

    // MARK: - Properties

    /// Pattern
    let pattern: String

    /// Delay
    let delay: Double

    // MARK: - Initializers

    /// Create pattern
    /// - Parameters:
    ///   - pattern: some pattern
    ///   - delay: some delay
    init(pattern: String, delay: Double = 0.02) {
        self.pattern = pattern
        self.delay = delay
    }
}
