//
//  UIView+.swift
//  
//
//  Created by Yuki Okudera on 2023/06/10.
//

import ExtensionCompatible
import UIKit

extension UIView: ExtensionCompatible {}

extension Extension where Base: UIView {

    public func pinEdgesToSuperview() {
        let constraintAttributes: [NSLayoutConstraint.Attribute] = [.left, .right, .top, .bottom]
        let constraints = constraintAttributes.map {
            NSLayoutConstraint(
                item: base,
                attribute: $0,
                relatedBy: .equal,
                toItem: base.superview,
                attribute: $0,
                multiplier: 1.0,
                constant: .zero
            )
        }
        base.superview?.addConstraints(constraints)
    }
}
