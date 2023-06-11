//
//  QiitaSearchViewData.swift
//  
//
//  Created by Yuki Okudera on 2023/06/10.
//

import Entity
import Foundation

public actor QiitaSearchViewData: ObservableObject {

    @MainActor @Published private(set) var title: String = ""
    @MainActor @Published var searchBarText: String = ""
    @MainActor @Published var searchedText: String = ""
    @MainActor @Published private(set) var isLoading: Bool = false
    @MainActor @Published private(set) var items: [Item] = []
    @MainActor private(set) var page: Int = 1

    public init() {}

    func updateTitle(title: String) async {
        await MainActor.run {
            self.title = title
        }
    }

    func updateSearchBarText(searchBarText: String) async {
        await MainActor.run {
            self.searchBarText = searchBarText
        }
    }

    func updateSearchedText(searchedText: String) async {
        await MainActor.run {
            self.searchedText = searchedText
        }
    }

    func updateIsLoading(isLoading: Bool) async {
        await MainActor.run {
            self.isLoading = isLoading
        }
    }

    func updateItems(items: [Item]) async {
        await MainActor.run {
            self.items = items
        }
    }

    func appendItems(items: [Item]) async {
        await MainActor.run {
            self.items.append(contentsOf: items)
        }
    }

    func updatePage(page: Int) async {
        await MainActor.run {
            self.page = page
        }
    }
}
