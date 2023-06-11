//
//  QiitaSearchScreenBuildable.swift
//  
//
//  Created by Yuki Okudera on 2023/06/11.
//

import Buildable
import UIKit

public protocol QiitaSearchScreenBuildable: Buildable {
    func makeViewController() -> UIViewController
}

public protocol QiitaSearchScreenBuilderProvider {
    func qiitaSearchScreenBuilder() -> QiitaSearchScreenBuildable
}
