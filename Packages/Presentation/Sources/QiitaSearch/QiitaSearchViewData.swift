//
//  QiitaSearchViewData.swift
//  
//
//  Created by Yuki Okudera on 2023/06/10.
//

import Foundation

actor QiitaSearchViewData: ObservableObject {

    @MainActor @Published private(set) var title: String = ""
    @MainActor @Published private(set) var dataList: [String] = []

    func updateTitle(title: String) async {
        await MainActor.run {
            self.title = title
        }
    }

    func updateDataList(dataList: [String]) async {
        await MainActor.run {
            self.dataList = dataList
        }
    }
}
