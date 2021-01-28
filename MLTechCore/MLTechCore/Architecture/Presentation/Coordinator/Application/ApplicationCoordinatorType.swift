//
//  ApplicationCoordinatorType.swift
//  MLTechCore
//
//  Created by Sergio Giraldo on 24/01/21.
//  Copyright © 2021 Cebollitas. All rights reserved.
//

import Foundation

public protocol ApplicationCoordinatorType: ProductListCoordinatorType {
    func runProductListModule()
}

public protocol ProductListCoordinatorType: CoordinatorType {
    func runProductDetailModule(for productId: String)
}
