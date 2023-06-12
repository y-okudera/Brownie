//
//  QiitaSearchScreenView.swift
//  
//
//  Created by Yuki Okudera on 2023/06/10.
//

import DesignSystem
import Entity
import Extensions
import SwiftUI

protocol QiitaSearchScreenViewDelegate: AnyObject {
    func qiitaSearchScreenView(
        _ qiitaSearchScreenView: QiitaSearchScreenView,
        didSetTitle title: String
    )

    func qiitaSearchScreenView(
        _ qiitaSearchScreenView: QiitaSearchScreenView,
        didSelectItem item: Item
    )
}

struct QiitaSearchScreenView: View {

    weak var delegate: QiitaSearchScreenViewDelegate?
    var presenter: QiitaSearchPresenterInput?
    @ObservedObject var viewData: QiitaSearchViewData

    var body: some View {
        VStack {
            SearchBar(
                searchText: Binding(
                    get: { self.viewData.searchBarText },
                    set: { text in Task { await self.presenter?.searchBarTextDidChange(to: text) } }
                ),
                placeholder: "記事検索",
                onSearchButtonClicked: {
                    Task { await self.presenter?.performSearch() }
                }
            )

            Spacer()

            self.content()
                .when(self.viewData.items.isEmpty && self.viewData.isLoading) { _ in
                    ProgressView()
                }
                .when(viewData.items.isEmpty && !self.viewData.isLoading) { _ in
                    self.emptyContent()
                }
                .onAppear {
                    Task { await self.presenter?.onAppear() }
                }
                .onChange(of: self.viewData.title) {
                    self.delegate?.qiitaSearchScreenView(self, didSetTitle: $0)
                }

            Spacer()
        }
    }

    @ViewBuilder
    private func content() -> some View {
        List(self.viewData.items, id: \.self.id) { item in
            Text(item.title)
                .onTapGesture {
                    self.delegate?.qiitaSearchScreenView(self, didSelectItem: item)
                }
                .onAppear {
                    if self.viewData.items.last == item {
                        print("last item: \(item.title)")
                        Task { await self.presenter?.performAdditionalRequest() }
                    }
                }
        }
        .listStyle(.plain)
    }

    @ViewBuilder
    private func emptyContent() -> some View {
        Text("データがありません。\nキーワードを入力して検索してください。")
            .multilineTextAlignment(.center)
    }
}

struct QiitaSearchScreenView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            QiitaSearchScreenView(presenter: nil, viewData: .init())
                .navigationTitle("QiitaSearch")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}
