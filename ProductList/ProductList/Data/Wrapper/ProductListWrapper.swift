//
//  ProductListWrapper.swift
//  ProductList
//
//  Created by Sergio Giraldo on 24/01/21.
//  Copyright © 2021 Cebollitas. All rights reserved.
//

import MLTechCore

struct ProductListWrapper: CoreWrapperType {
    static func map(_ apiData: APIProductList) throws -> ProductList {
        let coreSort = CoreSort(identifier: apiData.sort.identifier, name: apiData.sort.name)
        let corePaging = CorePaginate(offset: apiData.paging.offset, limit: apiData.paging.limit)

        let results = apiData.results.map { result in
            ProductListResult(
                identifier: result.identifier,
                title: result.title,
                price: result.price,
                availableQuantity: result.availableQuantity,
                thumbnail: result.thumbnail,
                freeShipping: result.shipping.freeShipping)
        }

        return ProductList(sort: coreSort, paging: corePaging, results: results)
    }
}
