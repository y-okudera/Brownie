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

    var searchItemsUseCase: SearchItemsUseCase {
        return searchItemsUseCaseComponent.searchItemsUseCaseBuilder().makeUseCase(itemsApiRepository: self.itemsApiRepository)
    }
}

// MARK: - SearchItemsUseCaseDependency
extension RootComponent {

    var itemsApiRepository: ItemsApiRepository {
        return shared {
            itemsApiRepositoryComponent.itemsApiRepositoryBuilder().makeRepository()
        }
    }
}

// MARK: - QiitaSearchScreenDependency
extension RootComponent {

    var qiitaSearchViewData: QiitaSearchViewData {
        return shared {
            QiitaSearchViewData()
        }
    }

    var qiitaSearchPresenterInput: QiitaSearchPresenterInput {
        return shared {
            QiitaSearchPresenter(
                viewData: qiitaSearchViewData,
                searchItemsUseCase: searchItemsUseCase
            )
        }
    }
}
