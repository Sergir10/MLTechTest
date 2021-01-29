//
//  SearchProductUseCase.swift
//  ProductList
//
//  Created by Sergio Giraldo on 24/01/21.
//  Copyright © 2021 Cebollitas. All rights reserved.
//

import Combine
import MLTechCore

struct SearchProductParams {
    let query: String
    let paging: CorePaginate?
}

final class SearchProductUseCase: BaseUseCase<ProductList, SearchProductParams> {
    private var productListRepository: ProductListRespositoryType

    init(productListRepository: ProductListRespositoryType) {
        self.productListRepository = productListRepository
    }

    override func buildUseCase(params: SearchProductParams) -> AnyPublisher<ProductList, InterfaceError> {
        productListRepository.searchProduct(by: params.query, page: params.paging)
            .mapError { self.userFriendlyError($0) }
            .eraseToAnyPublisher()
    }

    private func userFriendlyError(_ error: Error) -> InterfaceError {
        LocalLogger.register(model: LogModel(level: .error, data: error.localizedDescription, message: "Error while request product by id."))

        return InterfaceError.custom(
            message: "Ha ocurrido un error, por favor intente más tarde. En caso de persistir el error, comunicarse con soporte.")
    }
}
