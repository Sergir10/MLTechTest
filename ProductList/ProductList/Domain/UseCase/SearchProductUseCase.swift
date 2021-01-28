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
    private var productRepository: ProductListRespositoryType

    init(productRepository: ProductListRespositoryType) {
        self.productRepository = productRepository
    }

    override func buildUseCase(params: String) -> AnyPublisher<ProductList, InterfaceError> {
        productRepository.searchProduct(by: params)
            .mapError { self.userFriendlyError($0) }
            .eraseToAnyPublisher()
    }

    private func userFriendlyError(_ error: Error) -> InterfaceError {
        LocalLogger.register(model: LogModel(level: .error, data: error.localizedDescription, message: "Error while request product by id."))

        return InterfaceError.custom(
            message: "Ha ocurrido un error, por favor intente más tarde. En caso de persistir el error, comunicarse con soporte.")
    }
}
