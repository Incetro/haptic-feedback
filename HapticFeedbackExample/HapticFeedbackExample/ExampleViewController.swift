//
//  ExampleViewController.swift
//  HapticFeedbackExample
//
//  Created by Alexander Lezya on 14.12.2020.
//

import UIKit
import AloeStackView
import HapticFeedback

// MARK: - ExampleViewController

final class ExampleViewController: AloeStackViewController {

    /// HeaderView instance
    private let headerView = HeaderView()

    /// SixButtonsView instance
    private let sixButtonsView = SixButtonsView(appearance: .default)

    /// BigButtonView instance
    private let bigButtonView = BigButtonView(appearance: .default)

    /// PatternView instance
    private let patternView = PatternView(appearance: .default)

    // MARK: - Overrides

    override func viewDidLoad() {
        super.viewDidLoad()
        setupStackViews()
    }
}

// MARK: - Useful

extension ExampleViewController {

    private func showAlert(title: String, message: String, hapticFeedbackNotification: HapticFeedbackNotification) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        present(alert, animated: true, hapticFeedbackNotification: hapticFeedbackNotification)
    }
}

// MARK: - Layout

extension ExampleViewController {

    private func setupStackViews() {
        setupStackView()
        setupHeaderView()
        setupSixButtonsView()
        setupBigButtonView()
        setupPatternView()
    }

    private func setupStackView() {
        stackView.axis = .vertical
        stackView.rowInset = .zero
        stackView.hidesSeparatorsByDefault = true
        stackView.scrollsToTop = true
    }

    private func setupHeaderView() {
        headerView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addRow(headerView)
        headerView.heightAnchor.constraint(equalToConstant: LayoutConstants.headerViewHeight).isActive = true
    }

    private func setupSixButtonsView() {
        stackView.addRow(sixButtonsView)
        sixButtonsView.delegate = self
    }

    private func setupBigButtonView() {
        stackView.addRow(bigButtonView)
    }

    private func setupPatternView() {
        stackView.addRow(patternView)
        patternView.delegate = self
    }
}

// MARK: - PatternViewDelegate

extension ExampleViewController: PatternViewDelegate {

    func didChangePattrnView() {
    }
}

// MARK: - SixButtonsViewDelegate

extension ExampleViewController: SixButtonsViewDelegate {

    func alertButtonTapped(title: String, notification: HapticFeedbackNotification) {
        showAlert(
            title: "\(title)!",
            message: String(format: NSLocalizedString("Alert %@",comment: ""), title.lowercased()),
            hapticFeedbackNotification: notification
        )
    }
}

// MARK: - LayoutConstants

private enum LayoutConstants {
    static let headerViewHeight: CGFloat = 113
}
