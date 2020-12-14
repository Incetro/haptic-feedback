//
//  HapticFeedbackError.swift
//  HapticFeedback IOS
//
//  Created by Alexander Lezya on 11.12.2020.
//

import Foundation

// MARK: - HapticFeedbackError

public enum HapticFeedbackError: Error {
    case notSupportedByOS
    case notSupportedByDevice
    case notSupported
}
