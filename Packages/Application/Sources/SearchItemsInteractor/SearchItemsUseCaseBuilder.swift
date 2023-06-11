//
//  SearchItemsUseCaseBuilder.swift
//  
//
//  Created by Yuki Okudera on 2023/06/11.
//

import ApplicationInterface
import Buildable
import NeedleFoundation
import InfrastructureInterface

public protocol SearchItemsUseCaseDependency: Dependency {
    var itemsApiRepository: ItemsApiRepository { get }
}

public final class SearchItemsUseCaseComponent: Component<SearchItemsUseCaseDependency>, SearchItemsUseCaseBuilderProvider {

    public func searchItemsUseCaseBuilder() -> SearchItemsUseCaseBuildable {
        return SearchItemsUseCaseBuilder(dependency: dependency)
    }
}

private final class SearchItemsUseCaseBuilder: Builder<SearchItemsUseCaseDependency>, SearchItemsUseCaseBuildable {

    func makeUseCase(itemsApiRepository: ItemsApiRepository) -> SearchItemsUseCase {
        return SearchItemsInteractor(repository: dependency.itemsApiRepository)
    }
}
