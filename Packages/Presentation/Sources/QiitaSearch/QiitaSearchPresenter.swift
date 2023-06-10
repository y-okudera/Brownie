//
//  QiitaSearchPresenter.swift
//  
//
//  Created by Yuki Okudera on 2023/06/10.
//

import Foundation

protocol QiitaSearchPresenterInput {
    var viewData: QiitaSearchViewData { get }
    func onAppear() async
}

final class QiitaSearchPresenter: QiitaSearchPresenterInput {

    let viewData: QiitaSearchViewData

    init(viewData: QiitaSearchViewData) {
        self.viewData = viewData
    }

    func onAppear() async {
        await self.viewData.updateDataList(dataList: ["1", "2", "3"])
        await self.viewData.updateTitle(title: "QiitaSearch")
    }
}
