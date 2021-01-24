//
//  ProductListCoordinator.swift
//  ProductList
//
//  Created Sergio Giraldo on 24/01/21.
//  Copyright © 2021 Cebollitas. All rights reserved.
//

import MLTechCore
import UIKit

public protocol ProductListCoordinatorType: CoordinatorType {}

public final class ProductListCoordinator: BaseCoordinator {
    public override func start() {
        let module = ProductListConfigurator.getModule(
            moduleInput: ProductListConfigurator.ModuleInput(coordinator: self))

        navigationController.setViewControllers([module], animated: false)
        navigationController.setNavigationBarHidden(true, animated: false)
    }
}

extension ProductListCoordinator: ProductListCoordinatorType {}
