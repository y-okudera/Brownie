//
//  QiitaSearchViewBuilder.swift
//  
//
//  Created by Yuki Okudera on 2023/06/10.
//

import NeedleFoundation
import Buildable
import UIKit

final class QiitaSearchViewBuilder: Builder<QiitaSearchDependency>, QiitaSearchViewBuildable {

   func makeViewController() -> UIViewController {
       let vc = QiitaSearchViewController()
       vc.viewData = dependency.qiitaSearchViewData
       vc.presenter = dependency.qiitaSearchPresenterInput
       return vc
   }
}

public final class QiitaSearchComponent: Component<QiitaSearchDependency>, QiitaSearchViewBuilderProvider {

    public func qiitaSearchViewBuilder() -> QiitaSearchViewBuildable {
        QiitaSearchViewBuilder(dependency: dependency)
    }
}

public protocol QiitaSearchDependency: Dependency {
    var qiitaSearchViewData: QiitaSearchViewData { get }
    var qiitaSearchPresenterInput: QiitaSearchPresenterInput { get }
}
