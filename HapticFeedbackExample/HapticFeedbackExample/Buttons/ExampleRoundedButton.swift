//
//  ExampleRoundedButton.swift
//  HapticFeedbackExample
//
//  Created by Alexander Lezya on 15.12.2020.
//

import UIKit
import HapticFeedback

// MARK: - ExampleRoundedButton

class ExampleRoundedButton: HapticFeedbackButton {

    // MARK: - Properties

    /// Bouncing transform
    private let bouncingTransform: CGAffineTransform = .init(scaleX: Constants.highlightingScale, y: Constants.highlightingScale)

    // MARK: - Overrides

    override public var isHighlighted: Bool {
        didSet {
            let transform = isHighlighted ? bouncingTransform : .identity
            animate(transform)
            if isTouchInside {
                let transform = bouncingTransform
                animate(transform)
            }
        }
    }

    // MARK: - Initializers

    /// Default Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Overrides

    public override func layoutSubviews() {
        super.layoutSubviews()
        smoothlyRoundCourners(.allCorners, radius: Constants.cornerRadius)
    }

    // MARK: - Private

    /// Need to smoothly round corners
    private func smoothlyRoundCourners(
        _ corners: UIRectCorner = .allCorners,
        radius: CGFloat,
        inRect rect: CGRect? = nil
    ) {
        let roundPath = UIBezierPath(
            roundedRect: rect ?? bounds,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        let maskLayer = CAShapeLayer()
        maskLayer.path = roundPath.cgPath
        layer.mask = maskLayer
    }
}

// MARK: - Animations

extension ExampleRoundedButton {

    private func setup() {
        self.addTarget(self, action: #selector(touchInside), for: .touchUpInside)
    }

    @objc private func touchInside() {
        UIView.animate(
            withDuration: Constants.animationDuration,
            delay: 0,
            options: [.allowUserInteraction],
            animations: {
                self.transform = CGAffineTransform(scaleX: Constants.touchInsideScale, y: Constants.touchInsideScale)
            },
            completion: { _ in
                UIView.animate(
                    withDuration: Constants.animationDuration,
                    delay: 0,
                    options: [.allowUserInteraction]
                ) {
                    self.transform = CGAffineTransform.identity
                }
            }
        )
    }

    private func animate(_ transform: CGAffineTransform) {
        UIView.animate(
            withDuration: Constants.animationDuration,
            delay: 0,
            options: [.curveEaseIn, .allowUserInteraction]
        ) {
            self.transform = transform
        }
    }
}

// MARK: - Constants

extension ExampleRoundedButton {
    
    enum Constants {
        static let cornerRadius: CGFloat = 21
        static let animationDuration: Double = 0.175
        static let highlightingScale: CGFloat = 0.94
        static let touchInsideScale: CGFloat = 0.95
    }
}
