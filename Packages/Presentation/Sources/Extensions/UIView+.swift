//
//  UIView+.swift
//  
//
//  Created by Yuki Okudera on 2023/06/10.
//

import UIKit

extension UIView {

    public func pinEdgesToSuperview() {
        let constraintAttributes: [NSLayoutConstraint.Attribute] = [.left, .right, .top, .bottom]
        let constraints = constraintAttributes.map {
            NSLayoutConstraint(
                item: self,
                attribute: $0,
                relatedBy: .equal,
                toItem: self.superview,
                attribute: $0,
                multiplier: 1.0,
                constant: .zero
            )
        }
        self.superview?.addConstraints(constraints)
    }
}
