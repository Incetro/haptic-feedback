//
//  UIViewController.swift
//  HapticFeedback IOS
//
//  Created by Alexander Lezya on 11.12.2020.
//

import UIKit

// MARK: - UIViewController

extension UIViewController: Hapticable {

    // MARK: - Usefull

    /// Present view controller with haptic feedback notifications
    /// - Parameters:
    ///   - viewControllerToPresent: current view controller
    ///   - flag: bool flag
    ///   - hapticFeedbackNotification: hapticFeedbackNotification types
    ///   - completion: completion handler
    public func present(
        _ viewControllerToPresent: UIViewController,
        animated flag: Bool,
        hapticFeedbackNotification: HapticFeedbackNotification,
        completion: (() -> Void)? = nil
    ) {
        present(viewControllerToPresent, animated: flag, completion: completion)
        hapticFeedback.generate(hapticFeedbackNotification)
    }
}
