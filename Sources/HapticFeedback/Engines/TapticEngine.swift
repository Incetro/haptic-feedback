//
//  TapticEngine.swift
//  HapticFeedback IOS
//
//  Created by Alexander Lezya on 11.12.2020.
//

import UIKit
import AudioToolbox.AudioServices
import DeviceKit

// MARK: - TapticEngine

final class TapticEngine {

    // MARK: - SoundID

    struct SoundID {
        static let successID = SystemSoundID(1519)
        static let warningID = SystemSoundID(1102)
        static let errorID = SystemSoundID(1107)
    }

    // MARK: - Properties

    /// Log flag
    let logEnabled: Bool

    // MARK: - Initializers

    /// Default initializer
    /// - Parameter logEnabled: logEnabled instance
    init(logEnabled: Bool) {
        self.logEnabled = logEnabled
    }
}

// MARK: - HapticFeedbackEngine

extension TapticEngine: HapticFeedbackEngine {

    /// Prepare for some impact action
    /// - Parameter style: some impact style
    func prepare(_ style: HapticFeedbackImpactStyle) throws {
        guard Device.current.hasTapticEngine else { throw HapticFeedbackError.notSupportedByDevice }
    }

    /// Prepare for some notification
    /// - Parameter notification: some haptic feedback notification
    func prepare(_ notification: HapticFeedbackNotification) throws {
    }

    /// Generate for some notification
    /// - Parameter notification: some haptic feedback notification
    func generate(_ notification: HapticFeedbackNotification) {
        guard Device.current.hasTapticEngine else { return }
        switch notification {
        case .success:
            AudioServicesPlaySystemSoundWithCompletion(SoundID.successID, nil)
        case .warning:
            AudioServicesPlaySystemSoundWithCompletion(SoundID.warningID, nil)
        case .error:
            AudioServicesPlaySystemSoundWithCompletion(SoundID.errorID, nil)
        }
    }
}
