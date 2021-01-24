//
//  APIProductList.swift
//  ProductList
//
//  Created by Sergio Giraldo on 24/01/21.
//  Copyright © 2021 Cebollitas. All rights reserved.
//

import Foundation
import MLTechCore

struct APIProductList: Codable {
    let sort: APICoreSort
    let paging: APICorePaginate
    let results: [APIProductListResult]
}
