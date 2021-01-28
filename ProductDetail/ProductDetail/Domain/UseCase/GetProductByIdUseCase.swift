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
            .mapError { self.userFriendlyError($0) }
            .eraseToAnyPublisher()
    }

    private func userFriendlyError(_ error: Error) -> InterfaceError {
        LocalLogger.register(model: LogModel(level: .error, data: error.localizedDescription, message: "Error while request product by id."))

        return InterfaceError.custom(
            message: "Se hizo un prueba COVID al dispositivo y resulto positiva, por favor ponerse en contacto con servicio sanitario.")
    }
}
