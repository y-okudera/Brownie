//
//  ItemsRequest.swift
//  
//
//  Created by Yuki Okudera on 2022/11/23.
//

import ApiRequester
import Foundation

public struct ItemsRequest: ApiRequestable, Equatable {

    public typealias Response = ItemsResponse

    public init(page: Int, perPage: Int = 20, query: String) {
        self.page = page
        self.perPage = perPage
        self.query = query
    }

    private let page: Int

    private let perPage: Int

    private let query: String

    public let path: String = "/api/v2/items"

    public let method: String = "GET"

    public var queryItems: [URLQueryItem]? {
        [
            .init(name: "page", value: "\(self.page)"),
            .init(name: "per_page", value: "\(self.perPage)"),
            .init(name: "query", value: "\(self.query)"),
        ]
    }
}
