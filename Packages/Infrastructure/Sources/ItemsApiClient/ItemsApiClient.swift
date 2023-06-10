//
//  ItemsApiClient.swift
//  
//
//  Created by Yuki Okudera on 2022/11/23.
//

import ApiRequester
import InfrastructureInterface
import Foundation

struct ItemsApiClient: ItemsApiRepository {

    func send(page: Int, perPage: Int, query: String) async throws -> ItemsResponse {
        return try await ApiRequester.request(ItemsRequest(page: page, perPage: perPage, query: query))
    }
}
