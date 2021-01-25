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
        var searchProductUseCase: BaseUseCase<ProductList, String>
    }

    private let dependencies: Dependencies

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        super.init()
    }

    override func viewDidLoad() {
        searchProduct()
    }

    private func searchProduct() {
        dependencies.searchProductUseCase.execute(
            params: "iPhone",
            onSuccess: { value in
                print("FIRST RESULT: \(value.results.first!)")
            },
            onError: { _ in },
            onFinished: {})
    }
}

extension ProductListPresenter: ProductListPresenterType {}
