//
//  QiitaSearchScreenBuilder.swift
//  
//
//  Created by Yuki Okudera on 2023/06/10.
//

import ApplicationInterface
import Buildable
import NeedleFoundation
import PresentationInterface
import UIKit

public protocol QiitaSearchScreenDependency: Dependency {
    var searchItemsUseCase: SearchItemsUseCase { get }
    var qiitaSearchScreenComponent: QiitaSearchScreenComponent { get }
}

public final class QiitaSearchScreenComponent: Component<QiitaSearchScreenDependency>, QiitaSearchScreenBuilderProvider {

    public func qiitaSearchScreenBuilder() -> QiitaSearchScreenBuildable {
        return QiitaSearchScreenBuilder(dependency: dependency)
    }
}

private final class QiitaSearchScreenBuilder: Builder<QiitaSearchScreenDependency>, QiitaSearchScreenBuildable {

    func makeViewController() -> UIViewController {
        let viewData = QiitaSearchViewData()
        let vc = QiitaSearchViewController()
        let presenter = QiitaSearchPresenter(viewData: viewData, searchItemsUseCase: dependency.searchItemsUseCase)
        vc.viewData = viewData
        vc.presenter = presenter
        vc.component = dependency.qiitaSearchScreenComponent
        return vc
    }
}
