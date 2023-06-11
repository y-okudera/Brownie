//
//  ItemsApiClient.swift
//  
//
//  Created by Yuki Okudera on 2022/11/23.
//

import ApiRequester
import Buildable
import InfrastructureInterface
import Foundation

public struct ItemsApiClient: ItemsApiRepository {

    public init() {}

    public func send(page: Int, perPage: Int, query: String) async throws -> ItemsResponse {
        return try await ApiRequester.request(ItemsRequest(page: page, perPage: perPage, query: query))
    }
}
