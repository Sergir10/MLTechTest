//
//  ApplicationConfigurator.swift
//  MLApplication
//
//  Created Sergio Giraldo on 23/01/21.
//  Copyright © 2021 Cebollitas. All rights reserved.
//

import MLTechCore
import UIKit

final class ApplicationConfigurator {
    static func getModule(moduleInput: ApplicationConfigurator.ModuleInput) -> UIViewController {
        let presenter = ApplicationPresenter(
            dependencies: ApplicationPresenter.Dependencies(coordinator: moduleInput.coordinator))

        let viewController = ApplicationViewController(presenter: presenter)
        viewController.modalPresentationStyle = .fullScreen

        return viewController
    }
}

extension ApplicationConfigurator {
    struct ModuleInput {
        let coordinator: ApplicationCoordinatorType
    }
}
