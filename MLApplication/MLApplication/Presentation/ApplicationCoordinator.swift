//
//  ApplicationCoordinatorType.swift
//  MLApplication
//
//  Created Sergio Giraldo on 23/01/21.
//  Copyright © 2021 Cebollitas. All rights reserved.
//

import MLTechCore
import UIKit

public protocol ApplicationCoordinatorType: CoordinatorType {
    func runSearchModule()
}

public final class ApplicationCoordinator: BaseCoordinator {
    private let window: UIWindow

    public init(window: UIWindow) {
        self.window = window
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
    public func runSearchModule() {}
}
