//
//  QiitaSearchPresenter.swift
//  
//
//  Created by Yuki Okudera on 2023/06/10.
//

import Foundation

public protocol QiitaSearchPresenterInput {
    var viewData: QiitaSearchViewData { get }
    func onAppear() async
}

public final class QiitaSearchPresenter: QiitaSearchPresenterInput {

    public let viewData: QiitaSearchViewData

    public init(viewData: QiitaSearchViewData) {
        self.viewData = viewData
    }

    public func onAppear() async {
        await self.viewData.updateDataList(dataList: ["1", "2", "3"])
        await self.viewData.updateTitle(title: "QiitaSearch")
    }
}
