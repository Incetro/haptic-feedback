//
//  HapticFeedbackEngineProtocol.swift
//  HapticFeedback IOS
//
//  Created by Alexander Lezya on 11.12.2020.
//

import UIKit

// MARK: - HapticFeedbackEngine

public protocol HapticFeedbackEngine {

    /// Log flag
    var logEnabled: Bool { get }

    /// Prepare device for some impact action
    /// - Parameter style: some impact style
    func prepare(_ style: HapticFeedbackImpactStyle) throws

    /// Prepare device for some haptic feedback notification
    /// - Parameter notification: some haptic feedback notification
    func prepare(_ notification: HapticFeedbackNotification) throws

    /// Generate feedback notification
    /// - Parameter notification: some haptic feedback notification
    func generate(_ notification: HapticFeedbackNotification)
}
