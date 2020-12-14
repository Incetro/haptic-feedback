//
//  PatternEngine.swift
//  HapticFeedback IOS
//
//  Created by Alexander Lezya on 11.12.2020.
//

import Foundation

// MARK: - PatternEngine

final class PatternEngine {

    // MARK: - PatternChar

    private enum PatternChar: Character {
        case space = "-"
        case signalHeavy = "O"
        case signalMedium = "o"
        case signalLight = "."
    }

    // MARK: - Properties

    /// Finish flag
    var isFinished: Bool {
        queue.operationCount == 0
    }

    /// Pattern
    let pattern: HapticFeedbackPattern

    /// Operation queue
    private lazy var queue: OperationQueue = {
        let queue = OperationQueue()
        queue.maxConcurrentOperationCount = 1
        return queue
    }()

    /// Notification engine
    private let engine: HapticFeedbackNotificationEngine

    /// Pause duration
    private let pauseDuration: TimeInterval

    // MARK: - Initializers

    /// Create engine pattern
    /// - Parameters:
    ///   - hapticEngine: hapticEngine instance
    ///   - pauseDuration: pauseDuration instance
    init(
        hapticEngine: HapticFeedbackNotificationEngine,
        pauseDuration: TimeInterval = 0.11,
        pattern: HapticFeedbackPattern
    ) {
        self.engine = hapticEngine
        self.pauseDuration = pauseDuration
        self.pattern = pattern
    }

    // MARK: - Useful

    /// Generate custom pattern pattern
    func generate() {
        for (_, character) in pattern.pattern.enumerated() {
            if character == PatternChar.space.rawValue {
                queue.addOperation(PauseOperation(delay: pattern.delay))
            } else if character == PatternChar.signalHeavy.rawValue {
                queue.addOperation(SignalOperation(hapticEngine: engine, impact: .heavy, pauseDuration: pauseDuration))
            } else if character == PatternChar.signalMedium.rawValue {
                queue.addOperation(SignalOperation(hapticEngine: engine, impact: .medium, pauseDuration: pauseDuration))
            } else if character == PatternChar.signalLight.rawValue {
                queue.addOperation(SignalOperation(hapticEngine: engine, impact: .light, pauseDuration: pauseDuration))
            }
        }
    }
}

// MARK: - SignalOperation

private final class SignalOperation: Operation {

    // MARK: - Properties

    /// Notification engine
    private unowned let engine: HapticFeedbackNotificationEngine

    /// Haptic feedback impact
    private let impact: HapticFeedbackImpactStyle

    /// Pause duration
    private let pauseDuration: TimeInterval

    // MARK: - Initializers

    /// Create signal operation
    /// - Parameters:
    ///   - hapticEngine: hapticEngine instance
    ///   - impact: impact instance
    ///   - pauseDuration: pauseDuration instance
    init(
        hapticEngine: HapticFeedbackNotificationEngine,
        impact: HapticFeedbackImpactStyle,
        pauseDuration: TimeInterval
    ) {
        self.engine = hapticEngine
        self.impact = impact
        self.pauseDuration = pauseDuration
    }

    // MARK: - Operation

    override func main() {
        DispatchQueue.main.async {
            self.engine.generate(self.impact)
        }
        Thread.sleep(forTimeInterval: pauseDuration)
    }
}

// MARK: - PauseOperation

private final class PauseOperation: Operation {

    // MARK: - Properties

    /// Delay
    private let delay: Double

    // MARK: - Initializers

    /// Default initializer
    /// - Parameter delay: delay instance
    init(delay: Double) {
        self.delay = delay
    }

    // MARK: - Operation

    override func main() {
        Thread.sleep(forTimeInterval: delay)
    }
}
