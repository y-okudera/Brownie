//
//  RootComponent.swift
//  Brownie
//
//  Created by Yuki Okudera on 2023/06/09.
//

import InfrastructureInterface
import ItemsApiClient
import NeedleFoundation
import QiitaSearchScreen
import SearchItemsInteractor

final class RootComponent: BootstrapComponent {

    var qiitaSearchViewData: QiitaSearchViewData {
        return shared { QiitaSearchViewData() }
    }

    var qiitaSearchPresenterInput: QiitaSearchPresenterInput {
        return shared {
            QiitaSearchPresenter(
                viewData: qiitaSearchViewData,
                searchItemsUseCase: SearchItemsInteractor(
                    repository: itemsApiRepositoryComponent.itemsApiRepositoryBuilder().makeRepository() as! ItemsApiRepository
                )
            )
        }
    }

    var itemsApiRepositoryComponent: ItemsApiRepositoryComponent {
        return ItemsApiRepositoryComponent(parent: self)
    }

    var qiitaSearchComponent: QiitaSearchComponent {
        return QiitaSearchComponent(parent: self)
    }
}
