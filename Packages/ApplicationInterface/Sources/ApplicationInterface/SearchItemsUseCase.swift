//
//  SearchItemsUseCase.swift
//  
//
//  Created by Yuki Okudera on 2023/06/10.
//

import Entity

public protocol SearchItemsUseCase {
    func execute(page: Int, perPage: Int, query: String) async throws -> [Item]
}
