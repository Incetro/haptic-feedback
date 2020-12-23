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

    // MARK: - Properties

    /// HeaderView - Main title
    private let headerView = HeaderView()

    /// ImpactButtonsView - Buttons with impacts feedback
    private let impactButtonsView = ImpactButtonsView(appearance: .default)

    /// BigButtonView - HapticFeedbackButton instance
    private let bigButtonView = BigButtonView(appearance: .default)

    /// PatternView - view for create and play custom impact patterns
    private let patternView = PatternView(appearance: .default)

    // MARK: - Overrides

    override func viewDidLoad() {
        super.viewDidLoad()
        setupStackViews()
        stackView.showsVerticalScrollIndicator = false
    }
}

// MARK: - Private

extension ExampleViewController {

    private func showAlert(title: String, message: String, hapticFeedbackNotification: HapticFeedbackNotification) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        present(alert, animated: true, hapticFeedbackNotification: hapticFeedbackNotification)
    }
}

// MARK: - Setup

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
        headerView.heightAnchor.constraint(equalToConstant: Constants.headerViewHeight).isActive = true
    }

    private func setupSixButtonsView() {
        stackView.addRow(impactButtonsView)
        impactButtonsView.delegate = self
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

    func didChangePatternView() {
    }
}

// MARK: - ImpactButtonsViewDelegate

extension ExampleViewController: ImpactButtonsViewDelegate {

    func alertButtonTapped(title: String, notification: HapticFeedbackNotification) {
        var newTitle = title.localized()
        newTitle.removeLast()
        showAlert(
            title: "\(newTitle)!",
            message: String(format: NSLocalizedString("alert %@",comment: ""), newTitle.lowercased()),
            hapticFeedbackNotification: notification
        )
    }
}

// MARK: - Constants

extension ExampleViewController {
    
    enum Constants {
        static let headerViewHeight: CGFloat = 113
    }
}
