//
//  ItemsApiRepository.swift
//  
//
//  Created by Yuki Okudera on 2023/06/10.
//

import Entity

public protocol ItemsApiRepository {
    func send(page: Int, perPage: Int, query: String) async throws -> [Item]
}
