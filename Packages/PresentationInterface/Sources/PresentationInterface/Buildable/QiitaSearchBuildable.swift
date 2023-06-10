//
//  QiitaSearchBuildable.swift
//  
//
//  Created by Yuki Okudera on 2023/06/10.
//

import UIKit

public protocol QiitaSearchBuildable: Buildable {
    func makeViewController() -> UIViewController
}

public protocol QiitaSearch {
    func qiitaSearchBuilder() -> QiitaSearchBuildable
}
