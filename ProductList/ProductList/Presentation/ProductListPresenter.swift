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
        
    }

    private func searchProduct(by name: String) {
        dependencies.searchProductUseCase.execute(
            params: name,
            onSuccess: { value in
                self.showProducts(value.results)
            },
            onError: { _ in },
            onFinished: {})
    }

    private func showProducts(_ products: [ProductListResult]) {
        let section = ProductListSectionViewModel(
            title: "Serched",
            data: products.map(trasnformProductEntity(_:)))

        view.showProduct([section])
    }

    private func trasnformProductEntity(_ product: ProductListResult) -> ProducListCellViewModel {
        return ProducListCellViewModel(
            title: product.title,
            price: product.price,
            availableQuantity: product.availableQuantity,
            thumbnail: product.thumbnail,
            freeShipping: product.freeShipping)
    }
}

extension ProductListPresenter: ProductListPresenterType {
    func searchBarSearchButtonClicked(with text: String) {
        searchProduct(by: text)
    }
}

