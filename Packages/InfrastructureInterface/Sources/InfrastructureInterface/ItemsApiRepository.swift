//
//  ItemsApiRepository.swift
//  
//
//  Created by Yuki Okudera on 2023/06/10.
//

import Buildable
import Entity

public protocol ItemsApiRepository: Repository {
    func send(page: Int, perPage: Int, query: String) async throws -> [Item]
}
