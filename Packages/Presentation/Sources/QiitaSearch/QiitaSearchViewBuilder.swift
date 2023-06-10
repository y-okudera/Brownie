//
//  QiitaSearchViewBuilder.swift
//  
//
//  Created by Yuki Okudera on 2023/06/10.
//

import UIKit

public enum QiitaSearchViewBuilder {
    public static func build() -> UIViewController {
        let vc = QiitaSearchViewController()
        let viewData = QiitaSearchViewData()
        vc.presenter = QiitaSearchPresenter(viewData: viewData)
        vc.viewData = viewData
        return vc
    }
}
