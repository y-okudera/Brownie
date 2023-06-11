//
//  QiitaSearchPresenter.swift
//  
//
//  Created by Yuki Okudera on 2023/06/10.
//

import ApplicationInterface
import Foundation

public protocol QiitaSearchPresenterInput {
    var viewData: QiitaSearchViewData { get }
    func onAppear() async
}

public final class QiitaSearchPresenter: QiitaSearchPresenterInput {

    public let viewData: QiitaSearchViewData

    public let searchItemsUseCase: SearchItemsUseCase

    public init(viewData: QiitaSearchViewData, searchItemsUseCase: SearchItemsUseCase) {
        self.viewData = viewData
        self.searchItemsUseCase = searchItemsUseCase
    }

    public func onAppear() async {
        await self.viewData.updateDataList(dataList: ["1", "2", "3"])
        await self.viewData.updateTitle(title: "QiitaSearch")
        let items = try? await self.searchItemsUseCase.execute(page: 1, perPage: 20, query: "Swift")
        print("items")
        dump(items ?? [])
    }
}
