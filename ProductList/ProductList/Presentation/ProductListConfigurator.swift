//
//  ProductListConfigurator.swift
//  ProductList
//
//  Created Sergio Giraldo on 24/01/21.
//  Copyright © 2021 Cebollitas. All rights reserved.
//

import MLTechCore
import UIKit

public final class ProductListConfigurator {
    public static func getModule(moduleInput: ProductListConfigurator.ModuleInput) -> UIViewController {
        let presenter = ProductListPresenter(
            dependencies: ProductListPresenter.Dependencies(coordinator: moduleInput.coordinator))

        let viewController = ProductListViewController(presenter: presenter)
        viewController.modalPresentationStyle = .fullScreen

        return viewController
    }
}

extension ProductListConfigurator {
    public struct ModuleInput {
        let coordinator: ProductListCoordinatorType

        public init(coordinator: ProductListCoordinatorType) {
            self.coordinator = coordinator
        }
    }
}
