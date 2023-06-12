//
//  RootComponent.swift
//  Brownie
//
//  Created by Yuki Okudera on 2023/06/09.
//

import ApplicationInterface
import InfrastructureInterface
import ItemsApiClient
import NeedleFoundation
import QiitaSearchScreen
import SearchItemsInteractor

final class RootComponent: BootstrapComponent {

    var itemsApiRepositoryComponent: ItemsApiRepositoryComponent {
        return ItemsApiRepositoryComponent(parent: self)
    }

    var searchItemsUseCaseComponent: SearchItemsUseCaseComponent {
        return SearchItemsUseCaseComponent(parent: self)
    }

    var qiitaSearchScreenComponent: QiitaSearchScreenComponent {
        return QiitaSearchScreenComponent(parent: self)
    }
}

// MARK: - SearchItemsUseCaseDependency
extension RootComponent {

    var itemsApiRepository: ItemsApiRepository {
        return shared {
            self.itemsApiRepositoryComponent.itemsApiRepositoryBuilder().makeRepository()
        }
    }
}

// MARK: - QiitaSearchScreenDependency
extension RootComponent {

    var searchItemsUseCase: SearchItemsUseCase {
        return shared {
            self.searchItemsUseCaseComponent.searchItemsUseCaseBuilder().makeUseCase(itemsApiRepository: self.itemsApiRepository)
        }
    }
}
