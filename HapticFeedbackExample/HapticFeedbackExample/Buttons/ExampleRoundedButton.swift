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

    /// Bouncing transform
    public var bouncingTransform: CGAffineTransform = .init(scaleX: 0.94, y: 0.94)

    /// Bouncing flag
    public var isBouncingEnabled = true

    // MARK: - Overrides

    override public var isHighlighted: Bool {
        didSet {
            guard isBouncingEnabled else { return }
            let transform: CGAffineTransform = isHighlighted ? bouncingTransform : .identity
            animate(transform)
            if isTouchInside {
                let transform: CGAffineTransform = bouncingTransform
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
        smoothlyRoundCourners(.allCorners, radius: LayoutConstants.cornerRadius)
    }

    // MARK: - Useful

    private func smoothlyRoundCourners(_ corners: UIRectCorner = .allCorners, radius: CGFloat, inRect rect: CGRect? = nil) {
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
            withDuration: 0.175,
            animations: {
                self.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
            },
            completion: { _ in
                UIView.animate(withDuration: 0.175) {
                    self.transform = CGAffineTransform.identity
                }
            }
        )
    }

    private func animate(_ transform: CGAffineTransform) {
        UIView.animate(
            withDuration: 0.175,
            delay: 0,
            options: [.curveEaseIn]
        ) {
            self.transform = transform
        }
    }
}

// MARK: - LayoutConstants

private enum LayoutConstants {
    static let cornerRadius: CGFloat = 21
}
