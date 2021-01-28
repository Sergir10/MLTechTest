//
//  ProductDetailViewController.swift
//  ProductDetail
//
//  Created Sergio Giraldo on 27/01/21.
//  Copyright © 2021 Cebollitas. All rights reserved.
//

import MLTechCore
import UIKit

final class ProductDetailViewController: BaseViewController<ProductDetailPresenterType, ProductDetailViewType> {
    private var imagePagerCollectionDataSource: ImagePagerDataSource!

    override func loadView() {
        view = ProductDetailView()
    }

    override func viewDidLoad() {
        initialSetup()
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = Theme.Color.primary
    }

    private func initialSetup() {
        imagePagerCollectionDataSource = ImagePagerDataSource(
            collectionView: customView.imagePagerComponentView.collectionView,
            pagerControl: customView.imagePagerComponentView.pagerControl,
            sections: [])
    }
}

extension ProductDetailViewController: ProductDetailViewControllerType {
    func setupView(from model: Product) {
        customView.conditionLabel.text = model.condition
        customView.titleLabel.text = model.title
    }

    func setupImagePager(with sections: [ImagePagerSectionViewModel]) {
        imagePagerCollectionDataSource.sections = sections
    }

    func setupPrice(_ price: String) {
        customView.priceLabel.text = price
    }

    func setupProductInformation(_ information: [ProductInformationViewModel], title: String) {
        customView.productInformationComponent.setupComponent(with: title, and: information)
    }
}
