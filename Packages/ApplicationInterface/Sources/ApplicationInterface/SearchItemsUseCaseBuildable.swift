//
//  SearchItemsUseCaseBuildable.swift
//  
//
//  Created by Yuki Okudera on 2023/06/11.
//

import Buildable
import Foundation
import InfrastructureInterface

public protocol SearchItemsUseCaseBuildable: Buildable {
    func makeUseCase(itemsApiRepository: ItemsApiRepository) -> SearchItemsUseCase
}

public protocol SearchItemsUseCaseBuilderProvider {
    func searchItemsUseCaseBuilder() -> SearchItemsUseCaseBuildable
}
