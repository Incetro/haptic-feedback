//
//  ImpactButtonsViewDelegate.swift
//  HapticFeedbackExample
//
//  Created by Alexander Lezya on 19.12.2020.
//

import HapticFeedback

// MARK: - ImpactButtonsViewDelegate

protocol ImpactButtonsViewDelegate: class {

    /// Alert button was tapped
    func alertButtonTapped(title: String, notification: HapticFeedbackNotification)
}
