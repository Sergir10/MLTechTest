//
//  ProductDetailPresenter.swift
//  ProductDetail
//
//  Created Sergio Giraldo on 27/01/21.
//  Copyright © 2021 Cebollitas. All rights reserved.
//

import Foundation
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

    override func viewDidLoad() {
        loadProduct()
    }

    private func loadProduct() {
        dependencies.getProductByIdUseCase.execute(
            params: dependencies.productId,
            onSuccess: { product in
                self.showProduct(product)
            },
            onError: { error in
                self.view.presentError(error)
            },
            onFinished: {})
    }

    private func showProduct(_ product: Product) {
        setupImageComponent(with: product.pictures)
        setupFormattedPrice(product.price, currencyId: product.currencyId)
        setupProductInformation(with: product.attributes)
        view.setupView(from: product)
    }

    private func setupImageComponent(with pictures: [Picture]) {
        let section = ImagePagerSectionViewModel(
            title: "",
            data: pictures.map { ImagePagerCellViewModel(imageURL: $0.secureUrl) })

        view.setupImagePager(with: [section])
    }

    private func setupFormattedPrice(_ price: Double, currencyId: String) {
        guard let formattedPrice = NSNumber(floatLiteral: price).toLocalCurrency() else {
            view.setupPrice("$ \(price)  \(currencyId)")
            return
        }

        view.setupPrice(formattedPrice + "  " + currencyId)
    }

    private func setupProductInformation(with attributes: [Attributes]) {
        let information = attributes.map {
            ProductInformationViewModel(elementName: $0.name, elementDescription: $0.value)
        }

        view.setupProductInformation(information, title: "Información del producto")
    }
}

extension ProductDetailPresenter: ProductDetailPresenterType {}
