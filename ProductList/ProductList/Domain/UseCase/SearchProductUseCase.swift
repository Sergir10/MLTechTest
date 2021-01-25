//
//  SearchProductUseCase.swift
//  ProductList
//
//  Created by Sergio Giraldo on 24/01/21.
//  Copyright © 2021 Cebollitas. All rights reserved.
//

import Combine
import MLTechCore

final class SearchProductUseCase: BaseUseCase<ProductList, String> {
    private var productRepository: ProductRespositoryType

    init(productRepository: ProductRespositoryType) {
        self.productRepository = productRepository
    }

    override func buildUseCase(params: String) -> AnyPublisher<ProductList, InterfaceError> {
        productRepository.searchProduct(by: params)
            .mapError { InterfaceError.custom(message: $0.localizedDescription) }
            .eraseToAnyPublisher()
    }
}
