//
//  QiitaSearchViewBuildable.swift
//  
//
//  Created by Yuki Okudera on 2023/06/11.
//

import Buildable
import UIKit

public protocol QiitaSearchViewBuildable: Buildable {
    func makeViewController() -> UIViewController
}

public protocol QiitaSearchViewBuilderProvider {
    func qiitaSearchViewBuilder() -> QiitaSearchViewBuildable
}
