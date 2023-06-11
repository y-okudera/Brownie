//
//  ItemsApiRepositoryBuilder.swift
//  
//
//  Created by Yuki Okudera on 2023/06/11.
//

import NeedleFoundation
import Buildable
import InfrastructureInterface

final class ItemsApiRepositoryBuilder: Builder<EmptyDependency>, ItemsApiRepositoryBuildable {

    func makeRepository() -> some ItemsApiRepository {
        return ItemsApiClient()
    }
}

public final class ItemsApiRepositoryComponent: Component<EmptyDependency>, ItemsApiRepositoryBuilderProvider {

    public func itemsApiRepositoryBuilder() -> any ItemsApiRepositoryBuildable {
        return ItemsApiRepositoryBuilder(dependency: dependency)
    }
}
