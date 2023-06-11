//
//  QiitaSearchScreenBuilder.swift
//  
//
//  Created by Yuki Okudera on 2023/06/10.
//

import Buildable
import NeedleFoundation
import PresentationInterface
import UIKit

public protocol QiitaSearchScreenDependency: Dependency {
    var qiitaSearchViewData: QiitaSearchViewData { get }
    var qiitaSearchPresenterInput: QiitaSearchPresenterInput { get }
}

public final class QiitaSearchScreenComponent: Component<QiitaSearchScreenDependency>, QiitaSearchScreenBuilderProvider {

    public func qiitaSearchScreenBuilder() -> QiitaSearchScreenBuildable {
        return QiitaSearchScreenBuilder(dependency: dependency)
    }
}

private final class QiitaSearchScreenBuilder: Builder<QiitaSearchScreenDependency>, QiitaSearchScreenBuildable {

    func makeViewController() -> UIViewController {
        let vc = QiitaSearchViewController()
        vc.viewData = dependency.qiitaSearchViewData
        vc.presenter = dependency.qiitaSearchPresenterInput
        return vc
    }
}
