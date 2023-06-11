//
//  ItemsApiRepositoryBuildable.swift
//  
//
//  Created by Yuki Okudera on 2023/06/11.
//

import Foundation

public protocol ItemsApiRepositoryBuildable: Buildable {
    associatedtype T: Repository
    func makeRepository() -> T
}

public protocol ItemsApiRepositoryBuilderProvider {
    func itemsApiRepositoryBuilder() -> any ItemsApiRepositoryBuildable
}
