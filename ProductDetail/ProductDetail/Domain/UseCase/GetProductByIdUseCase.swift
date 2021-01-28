//
//  GetProductByIdUseCase.swift
//  ProductDetail
//
//  Created by Sergio Giraldo on 27/01/21.
//  Copyright © 2021 Cebollitas. All rights reserved.
//

import Combine
import MLTechCore

final class GetProductByIdUseCase: BaseUseCase<Product, String> {
    private var productRepository: ProductDetailRepositoryType

    init(productRepository: ProductDetailRepositoryType) {
        self.productRepository = productRepository
    }

    override func buildUseCase(params: String) -> AnyPublisher<Product, InterfaceError> {
        productRepository.product(by: params)
            .mapError { InterfaceError.custom(message: $0.localizedDescription) }
            .eraseToAnyPublisher()
    }
}
