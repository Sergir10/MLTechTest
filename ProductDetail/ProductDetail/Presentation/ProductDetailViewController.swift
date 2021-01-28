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

    override func loadView() {
        view = ProductDetailView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ProductDetailViewController: ProductDetailViewControllerType {}
