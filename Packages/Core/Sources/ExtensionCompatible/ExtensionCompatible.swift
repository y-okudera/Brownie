//
//  ExtensionCompatible.swift
//  
//
//  Created by Yuki Okudera on 2023/06/11.
//

import Foundation

public struct Extension<Base> {
    public let base: Base
    init (_ base: Base) {
        self.base = base
    }
}

public protocol ExtensionCompatible {
    associatedtype Compatible
    static var ex: Extension<Compatible>.Type { get }
    var ex: Extension<Compatible> { get }
}

extension ExtensionCompatible {
    public static var ex: Extension<Self>.Type {
        return Extension<Self>.self
    }

    public var ex: Extension<Self> {
        return Extension(self)
    }
}
