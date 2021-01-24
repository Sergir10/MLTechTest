//
//  ProductListConfigurator.swift
//  ProductList
//
//  Created Sergio Giraldo on 24/01/21.
//  Copyright © 2021 Cebollitas. All rights reserved.
//

import MLTechCore
import UIKit

final class ProductListConfigurator {
    static func getModule(moduleInput: ProductListConfigurator.ModuleInput) -> UIViewController {
        let presenter = ProductListPresenter(
            dependencies: ProductListPresenter.Dependencies(coordinator: moduleInput.coordinator))
        
        let viewController = ProductListViewController(presenter: presenter)
        viewController.modalPresentationStyle = .fullScreen
        
        return viewController
    }
}

extension ProductListConfigurator {
    struct ModuleInput {
        let coordinator: ProductListCoordinatorType
    }
}
