//
//  QiitaSearchPresenter.swift
//  
//
//  Created by Yuki Okudera on 2023/06/10.
//

import ApplicationInterface
import Foundation

public protocol QiitaSearchPresenterInput {
    init(viewData: QiitaSearchViewData, searchItemsUseCase: SearchItemsUseCase)
    func onAppear() async
    func searchBarTextDidChange(to searchBarText: String) async
    func performSearch() async
    func performAdditionalRequest() async
}

public final class QiitaSearchPresenter: QiitaSearchPresenterInput {

    public let viewData: QiitaSearchViewData

    public let searchItemsUseCase: SearchItemsUseCase

    public init(viewData: QiitaSearchViewData, searchItemsUseCase: SearchItemsUseCase) {
        self.viewData = viewData
        self.searchItemsUseCase = searchItemsUseCase
    }

    public func onAppear() async {
        await self.viewData.updateTitle(title: "QiitaSearch")
    }

    public func searchBarTextDidChange(to searchBarText: String) async {
        await self.viewData.updateSearchBarText(searchBarText: searchBarText)
    }

    public func performSearch() async {
        await self.viewData.updateIsLoading(isLoading: true)
        await self.viewData.updatePage(page: 1)
        await self.viewData.updateItems(items: [])
        await self.viewData.updateSearchedText(searchedText: self.viewData.searchBarText)
        do {
            let items = try await self.searchItemsUseCase.execute(page: self.viewData.page, perPage: 20, query: self.viewData.searchedText)
            await self.viewData.updatePage(page: self.viewData.page + 1)
            await self.viewData.updateItems(items: items)
        } catch {
            print("e: \(error)")
        }
        await self.viewData.updateIsLoading(isLoading: false)
    }

    public func performAdditionalRequest() async {
        await self.viewData.updateIsLoading(isLoading: true)
        do {
            let items = try await self.searchItemsUseCase.execute(page: self.viewData.page, perPage: 20, query: self.viewData.searchedText)
            await self.viewData.updatePage(page: self.viewData.page + 1)
            await self.viewData.appendItems(items: items)
        } catch {
            print("e: \(error)")
        }
        await self.viewData.updateIsLoading(isLoading: false)
    }
}
