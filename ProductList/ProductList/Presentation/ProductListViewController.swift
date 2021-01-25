//
//  ProductListViewController.swift
//  ProductList
//
//  Created Sergio Giraldo on 24/01/21.
//  Copyright © 2021 Cebollitas. All rights reserved.
//

import MLTechCore
import UIKit

final class ProductListViewController: BaseViewController<ProductListPresenterType, ProductListViewType> {
    private var collectionViewDataSource: ProductCollectionViewDataSource!

    override func loadView() {
        view = ProductListView()
    }

    override func viewDidLoad() {
        initialSetup()
        super.viewDidLoad()
    }

    private func initialSetup() {
        collectionViewDataSource = ProductCollectionViewDataSource(
            collectionView: customView.productCollectionView,
            sections: [])
    }
}

extension ProductListViewController: ProductListViewControllerType {}
