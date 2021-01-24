//
//  ProductListRepository.swift
//  ProductList
//
//  Created by Sergio Giraldo on 24/01/21.
//  Copyright © 2021 Cebollitas. All rights reserved.
//

import Combine
import MLTechNetwork

final class ProductListRespository {
    private struct Constant {
        static let relativePath = "/sites/MCO/search"
    }

    private let client: RESTClientType

    init(client: RESTClientType) {
        self.client = client
    }

    private func endpointForQuery(_ query: String) -> RESTEndpoint {
        return RESTEndpoint(method: .get, relativePath: Constant.relativePath, params: ["q": query], contentType: .URLEncoded)
    }

    private func mapData(_ data: APIProductList) -> AnyPublisher<ProductList, ServiceError> {
        do {
            let domainData = try ProductListWrapper.map(data)
            return Future<ProductList, ServiceError> { $0(.success(domainData)) }.eraseToAnyPublisher()
        } catch {
            return Fail<ProductList, ServiceError>(error: ServiceError.serverError(response: error)).eraseToAnyPublisher()
        }
    }
}

extension ProductListRespository: ProductListRespositoryType {
    func searchProduct(by query: String) -> AnyPublisher<ProductList, ServiceError> {
        client.requestTo(endpoint: endpointForQuery(query), model: APIProductList.self)
            .flatMap { self.mapData($0) }
            .eraseToAnyPublisher()
    }
}
