//
//  ApplicationCoordinatorType.swift
//  MLApplication
//
//  Created Sergio Giraldo on 23/01/21.
//  Copyright © 2021 Cebollitas. All rights reserved.
//

import MLTechCore
import MLTechNetwork

import ProductList
import UIKit

public final class ApplicationCoordinator: BaseCoordinator {
    private let window: UIWindow
    private let restClient: RESTClientType

    public init(window: UIWindow, restClient: RESTClientType = RESTClient(baseURL: MLEnvironment.shared.selected.baseURL)) {
        self.window = window
        self.restClient = restClient
        super.init()
    }

    public override func start() {
        let module = ApplicationConfigurator.getModule(
            moduleInput: ApplicationConfigurator.ModuleInput(coordinator: self))

        navigationController.setViewControllers([module], animated: false)
        navigationController.setNavigationBarHidden(true, animated: false)

        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}

extension ApplicationCoordinator: ApplicationCoordinatorType {
    public func runProductListModule() {
        let module = ProductListConfigurator.getModule(
            moduleInput: ProductListConfigurator.ModuleInput(coordinator: self, client: restClient))

        navigationController.setViewControllers([module], animated: false)
    }

    public func runProductDetailModule(for productId: String) {
        
    }
}
