//
//  DeviceKit.swift
//  HapticFeedback IOS
//
//  Created by Alexander Lezya on 11.12.2020.
//

import DeviceKit

// MARK: - Device

extension Device {

    /// Return the `DeviceType` of the device in use
    var deviceType: Device {
        return Device.current
    }

    /// Return true if has taptic engine
    var hasTapticEngine: Bool {
        let engineDevice: [Device] = [
            .iPhone6s,
            .iPhone6sPlus,
            .iPhone7,
            .iPhone7Plus,
            .iPhone8,
            .iPhone8Plus,
            .iPhoneX,
            .iPhoneXR,
            .iPhoneXS,
            .iPhoneXSMax,
            .iPhone11,
            .iPhone11Pro,
            .iPhone11ProMax,
            .iPhoneSE2,
            .iPhone12Mini,
            .iPhone12,
            .iPhone12Pro,
            .iPhone12ProMax
        ]
        return engineDevice.contains(deviceType)
    }

    /// Return true if has haptic feedback
    var hasHapticFeedback: Bool {
        let hapticFeedbackDevice: [Device] = [
            .iPhone7,
            .iPhone7Plus,
            .iPhone8,
            .iPhone8Plus,
            .iPhoneX,
            .iPhoneXR,
            .iPhoneXS,
            .iPhoneXSMax,
            .iPhone11,
            .iPhone11Pro,
            .iPhone11ProMax,
            .iPhoneSE2,
            .iPhone12Mini,
            .iPhone12,
            .iPhone12Pro,
            .iPhone12ProMax
        ]
        return hapticFeedbackDevice.contains(deviceType)
    }
}
