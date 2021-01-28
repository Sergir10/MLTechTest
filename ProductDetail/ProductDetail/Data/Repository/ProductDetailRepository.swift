//
//  ProductDetailRepository.swift
//  ProductDetail
//
//  Created by Sergio Giraldo on 27/01/21.
//  Copyright © 2021 Cebollitas. All rights reserved.
//

import Combine
import MLTechCore
import MLTechNetwork

final class ProductDetailRepository {
    private struct Constant {
        static let relativePath = "/items/"
    }

    private let client: RESTClientType

    init(client: RESTClientType) {
        self.client = client
    }

    private func endpointForProductId(_ id: String) -> RESTEndpoint {
        return RESTEndpoint(method: .get, relativePath: Constant.relativePath + id, params: [:])
    }

    private func mapData(_ data: APIProduct) -> AnyPublisher<Product, ServiceError> {
        do {
            let domainData = try ProductWrapper.map(data)
            return Future { $0(.success(domainData)) }.eraseToAnyPublisher()
        } catch {
            return Fail(error: ServiceError.serverError(response: error)).eraseToAnyPublisher()
        }
    }
}

extension ProductDetailRepository: ProductDetailRepositoryType {
    func product(by id: String) -> AnyPublisher<Product, ServiceError> {
        client.requestTo(endpoint: endpointForProductId(id), model: APIProduct.self)
            .flatMap { self.mapData($0) }
            .eraseToAnyPublisher()
    }
}
