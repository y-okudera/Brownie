//
//  View+.swift
//  
//
//  Created by Yuki Okudera on 2023/06/11.
//

import SwiftUI

extension View {

    public func hidden(_ hidden: Bool) -> some View {
        hidden ? nil : self
    }
}

// MARK: - Condition
extension View {

    @ViewBuilder
    public func when(
        _ condition: Bool,
        @ViewBuilder transform: (Self) -> some View
    ) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }

    @ViewBuilder
    public func whenLet<V>(
        _ optional: V?,
        @ViewBuilder transform: (Self, V) -> some View
    ) -> some View {
        if let value = optional {
            transform(self, value)
        } else {
            self
        }
    }
}
