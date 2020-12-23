//
//  ExampleStackViewCellAppearance.swift
//  HapticFeedbackExample
//
//  Created by Alexander Lezya on 16.12.2020.
//

import UIKit

// MARK: - ExampleStackViewCellAppearance

struct ExampleStackViewCellAppearance {

    // MARK: - Properties
    
    let textFont: UIFont
    let textColor: UIColor

    // MARK: - Static

    static var `default`: ExampleStackViewCellAppearance {
        .init(
            textFont: UIFont(name: "SF Pro Rounded", size: 19) ?? UIFont.systemFont(ofSize: 19),
            textColor: .black
        )
    }
}
