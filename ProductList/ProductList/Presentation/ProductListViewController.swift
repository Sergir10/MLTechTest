//
//  ProductListViewController.swift
//  ProductList
//
//  Created Sergio Giraldo on 24/01/21.
//  Copyright © 2021 Cebollitas. All rights reserved.
//

import MLTechCore

final class ProductListViewController: BaseViewController<ProductListPresenterType, ProductListViewType> {

    override func loadView() {
        view = ProductListView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ProductListViewController: ProductListViewControllerType {}
