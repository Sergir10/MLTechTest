//
//  ApplicationPresenter.swift
//  MLApplication
//
//  Created Sergio Giraldo on 23/01/21.
//  Copyright © 2021 Cebollitas. All rights reserved.
//

import MLTechCore

final class ApplicationPresenter: BasePresenter<ApplicationViewController, ApplicationViewControllerType> {
    struct Dependencies {
        var coordinator: ApplicationCoordinatorType
    }

    private let dependencies: Dependencies

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        super.init()
    }
}

extension ApplicationPresenter: ApplicationPresenterType {}
