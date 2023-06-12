//
//  ItemsApiRepositoryComponent.swift
//  
//
//  Created by Yuki Okudera on 2023/06/11.
//

import NeedleFoundation
import Buildable
import InfrastructureInterface

public final class ItemsApiRepositoryComponent: Component<EmptyDependency>, ItemsApiRepositoryBuilderProvider {

    public func itemsApiRepositoryBuilder() -> ItemsApiRepositoryBuildable {
        return ItemsApiRepositoryBuilder(dependency: dependency)
    }
}

private final class ItemsApiRepositoryBuilder: Builder<EmptyDependency>, ItemsApiRepositoryBuildable {

    func makeRepository() -> ItemsApiRepository {
        return ItemsApiClient()
    }
}
