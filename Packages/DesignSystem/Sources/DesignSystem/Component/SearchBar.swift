//
//  SearchBar.swift
//  
//
//  Created by Yuki Okudera on 2023/06/11.
//

import SwiftUI

public struct SearchBar: UIViewRepresentable {

    @Binding public var searchText: String
    private let placeholder: String?
    private var onSearchButtonClicked: (() -> Void)?

    public init(
        searchText: Binding<String>,
        placeholder: String?,
        onSearchButtonClicked: (() -> Void)?
    ) {
        self._searchText = searchText
        self.placeholder = placeholder
        self.onSearchButtonClicked = onSearchButtonClicked
    }

    public func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    public func makeUIView(context: Context) -> UISearchBar {
        let searchBar = UISearchBar()
        searchBar.delegate = context.coordinator
        searchBar.placeholder = placeholder

        // remove lines.
        searchBar.backgroundImage = .init()

        return searchBar
    }

    public func updateUIView(_ uiView: UISearchBar, context: Context) {
        uiView.text = searchText
    }

    public class Coordinator: NSObject, UISearchBarDelegate {
        var searchBar: SearchBar

        init(_ searchBar: SearchBar) {
            self.searchBar = searchBar
        }

        public func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            self.searchBar.searchText = searchText
        }

        public func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            searchBar.resignFirstResponder()
            self.searchBar.onSearchButtonClicked?()
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(searchText: .constant("preview"), placeholder: "placeholder", onSearchButtonClicked: nil)
    }
}
