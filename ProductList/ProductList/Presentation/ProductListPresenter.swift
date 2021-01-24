//
//  ProductListPresenter.swift
//  ProductList
//
//  Created Sergio Giraldo on 24/01/21.
//  Copyright © 2021 Cebollitas. All rights reserved.
//

import MLTechCore

final class ProductListPresenter: BasePresenter<ProductListViewController, ProductListViewControllerType> {
    struct Dependencies {
        var coordinator: ProductListCoordinatorType
    }

    private let dependencies: Dependencies

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        super.init()
    }
}

extension ProductListPresenter: ProductListPresenterType {}
