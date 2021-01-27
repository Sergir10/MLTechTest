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

    override func viewDidLoad() {}

    private func searchProduct(by name: String) {
        dependencies.searchProductUseCase.execute(
            params: name,
            onSuccess: { productList in
                self.processProductList(productList)
            },
            onError: { _ in },
            onFinished: {})
    }

    private func processProductList(_ productsList: ProductList) {
        if productsList.results.isEmpty {
            showEmptyView()
        } else {
            showProducts(productsList.results)
        }
    }

    private func showProducts(_ products: [ProductListResult]) {
        view.showProduct(getFormattedProducts(from: products))
        view.setDescriptionTitle("Artículos encontrados.")
    }

    private func showEmptyView() {
        view.showEmptyState(getFormattedProducts(from: nil), message: "Producto no encontrado, intente de nuevo.")
    }

    private func getFormattedProducts(from products: [ProductListResult]?) -> ProductListSectionViewModel {
        return ProductListSectionViewModel(title: "", data: products?.map(trasnformProductEntity(_:)) ?? [])
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
