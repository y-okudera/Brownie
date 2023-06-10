//
//  RootComponent.swift
//  Brownie
//
//  Created by Yuki Okudera on 2023/06/09.
//

import NeedleFoundation
import QiitaSearch

final class RootComponent: BootstrapComponent {

    var qiitaSearchViewData: QiitaSearchViewData {
        return shared { QiitaSearchViewData() }
    }

    var qiitaSearchPresenterInput: QiitaSearchPresenterInput {
        return shared { QiitaSearchPresenter(viewData: qiitaSearchViewData) }
    }

    var qiitaSearchComponent: QiitaSearchComponent {
        return QiitaSearchComponent(parent: self)
    }
}
