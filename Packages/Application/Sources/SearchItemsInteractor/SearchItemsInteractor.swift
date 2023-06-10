//
//  SearchItemsInteractor.swift
//  
//
//  Created by Yuki Okudera on 2023/06/10.
//

import ApplicationInterface
import Entity
import InfrastructureInterface
import Foundation

public struct SearchItemsInteractor: SearchItemsUseCase {

    private let repository: ItemsApiRepository

    init (repository: ItemsApiRepository) {
        self.repository = repository
    }

    public func execute(page: Int, perPage: Int, query: String) async throws -> [Item] {
        return try await repository.send(page: page, perPage: perPage, query: query)
    }
}
