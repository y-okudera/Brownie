//
//  QiitaSearchBuilder.swift
//  
//
//  Created by Yuki Okudera on 2023/06/10.
//

import Core
import UIKit

final class QiitaSearchBuilder: Builder<QiitaSearchDependency>, QiitaSearchBuildable {

   func makeViewController() -> UIViewController {
       let vc = QiitaSearchViewController()
       vc.viewData = dependency.qiitaSearchViewData
       vc.presenter = dependency.qiitaSearchPresenterInput
       return vc
   }
}
