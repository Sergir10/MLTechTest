//
//  ProductListResult.swift
//  ProductList
//
//  Created by Sergio Giraldo on 24/01/21.
//  Copyright © 2021 Cebollitas. All rights reserved.
//

import Foundation

struct ProductListResult {
    let identifier: String
    let title: String
    let price: Int
    let availableQuantity: Int
    let thumbnail: String
    let freeShipping: Bool
}
