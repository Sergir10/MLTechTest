//
//  ProductDetailConfigurator.swift
//  ProductDetail
//
//  Created Sergio Giraldo on 27/01/21.
//  Copyright © 2021 Cebollitas. All rights reserved.
//

import MLTechCore
import MLTechNetwork
import UIKit

public final class ProductDetailConfigurator {
    public static func getModule(moduleInput: ProductDetailConfigurator.ModuleInput) -> UIViewController {
        let presenter = ProductDetailPresenter(
            dependencies: ProductDetailPresenter.Dependencies(
                getProductByIdUseCase: GetProductByIdUseCase(productRepository: ProductDetailRepository(client: moduleInput.client)),
                coordinator: moduleInput.coordinator,
                productId: moduleInput.productId))

        let viewController = ProductDetailViewController(presenter: presenter)
        viewController.modalPresentationStyle = .fullScreen

        return viewController
    }
}

extension ProductDetailConfigurator {
    public struct ModuleInput {
        let coordinator: ProductListCoordinatorType
        let client: RESTClientType
        let productId: String

        public init(coordinator: ProductListCoordinatorType, client: RESTClientType, productId: String) {
            self.coordinator = coordinator
            self.client = client
            self.productId = productId
        }
    }
}
