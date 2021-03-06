//
//  ProductListPresenter.swift
//  ProductList
//
//  Created Sergio Giraldo on 24/01/21.
//  Copyright © 2021 Cebollitas. All rights reserved.
//

import Foundation
import MLTechCore

final class ProductListPresenter: BasePresenter<ProductListViewController, ProductListViewControllerType> {
    struct Dependencies {
        var coordinator: ProductListCoordinatorType
        var searchProductUseCase: BaseUseCase<ProductList, SearchProductParams>
    }

    private let dependencies: Dependencies
    private var products: [ProductListResult] = []

    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        super.init()
    }

    private func searchProduct(by name: String) {
        view.showProgress()
        dependencies.searchProductUseCase.execute(
            params: SearchProductParams(query: name, paging: nil),
            onSuccess: { productList in
                self.processProductList(productList)
            },
            onError: { error in
                self.view.presentError(error)
                self.view.hideProgress()
            },
            onFinished: {
                self.view.hideProgress()
            })
    }

    private func processProductList(_ productsList: ProductList) {
        products = productsList.results

        if products.isEmpty {
            showEmptyView()
        } else {
            showProducts(products)
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

    func selectedItem(at indexpath: IndexPath) {
        guard indexpath.row < products.count else { return }

        let selectedProduct = products[indexpath.row]
        dependencies.coordinator.runProductDetailModule(for: selectedProduct.identifier)
    }

    func loadMoreReached() {
        view.presentError(InterfaceError.custom(message: "Pagination no implementada debido a falta de documentación en el API."))
    }
}
