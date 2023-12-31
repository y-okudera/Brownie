//
//  ItemsApiRepositoryBuildable.swift
//  
//
//  Created by Yuki Okudera on 2023/06/11.
//

import Buildable

public protocol ItemsApiRepositoryBuildable: Buildable {
    func makeRepository() -> ItemsApiRepository
}

public protocol ItemsApiRepositoryBuilderProvider {
    func itemsApiRepositoryBuilder() -> ItemsApiRepositoryBuildable
}
