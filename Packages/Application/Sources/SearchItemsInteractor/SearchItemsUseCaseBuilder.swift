//
//  SearchItemsUseCaseBuilder.swift
//  
//
//  Created by Yuki Okudera on 2023/06/11.
//

import ApplicationInterface
import InfrastructureInterface
import NeedleFoundation
import Buildable

final class SearchItemsUseCaseBuilder: Builder<SearchItemsUseCaseDependency>, SearchItemsUseCaseBuildable {

    func makeUseCase(itemsApiRepository: ItemsApiRepository) -> SearchItemsUseCase {
        return SearchItemsInteractor(repository: dependency.itemsApiRepository)
    }
}

public final class SearchItemsUseCaseComponent: Component<SearchItemsUseCaseDependency>, SearchItemsUseCaseBuilderProvider {

    public func searchItemsUseCaseBuilder() -> SearchItemsUseCaseBuildable {
        return SearchItemsUseCaseBuilder(dependency: dependency)
    }
}

public protocol SearchItemsUseCaseDependency: Dependency {
    var itemsApiRepository: ItemsApiRepository { get }
}
