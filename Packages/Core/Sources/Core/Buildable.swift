//
//  Buildable.swift
//  
//
//  Created by Yuki Okudera on 2023/06/10.
//

import NeedleFoundation

public protocol Buildable: AnyObject {}

open class Builder<Dependency>: Buildable {
    
    public let dependency: Dependency

    public init(dependency: Dependency) {
        self.dependency = dependency
    }
}
