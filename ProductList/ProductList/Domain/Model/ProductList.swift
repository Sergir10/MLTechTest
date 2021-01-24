//
//  ProductList.swift
//  ProductList
//
//  Created by Sergio Giraldo on 24/01/21.
//  Copyright © 2021 Cebollitas. All rights reserved.
//

import MLTechCore

struct ProductList: Codable {
    let sort: CoreSort
    let paging: CorePaginate
    let results: [ProductListResult]
}
