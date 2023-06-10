//
//  QiitaSearchComponent.swift
//  
//
//  Created by Yuki Okudera on 2023/06/10.
//

import PresentationInterface
import NeedleFoundation

public final class QiitaSearchComponent: Component<QiitaSearchDependency>, QiitaSearch {

    public func qiitaSearchBuilder() -> QiitaSearchBuildable {
        QiitaSearchBuilder(dependency: dependency)
    }
}
