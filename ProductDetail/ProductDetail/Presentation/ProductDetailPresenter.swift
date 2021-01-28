//
//  ProductDetailPresenter.swift
//  ProductDetail
//
//  Created Sergio Giraldo on 27/01/21.
//  Copyright © 2021 Cebollitas. All rights reserved.
//

import MLTechCore

final class ProductDetailPresenter: BasePresenter<ProductDetailViewController, ProductDetailViewControllerType> {
    struct Dependencies {
        var getProductByIdUseCase: BaseUseCase<Product, String>
        var coordinator: ProductListCoordinatorType
        var productId: String
    }

    private let dependencies: Dependencies

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        super.init()
    }

    override func viewDidLoad() {}
}

extension ProductDetailPresenter: ProductDetailPresenterType {}
