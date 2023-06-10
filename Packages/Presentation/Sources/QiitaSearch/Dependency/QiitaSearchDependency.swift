//
//  QiitaSearchDependency.swift
//  
//
//  Created by Yuki Okudera on 2023/06/10.
//

import NeedleFoundation

public protocol QiitaSearchDependency: Dependency {
    var qiitaSearchViewData: QiitaSearchViewData { get }
    var qiitaSearchPresenterInput: QiitaSearchPresenterInput { get }
}
