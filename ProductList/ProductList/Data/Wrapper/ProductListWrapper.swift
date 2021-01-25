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

        let results = apiData.results.compactMap { product in
            removeInvalidData(from: product)
        }

        return ProductList(sort: coreSort, paging: corePaging, results: results)
    }

    private static func removeInvalidData(from data: APIProductListResult) -> ProductListResult? {
        guard let identifier = data.identifier,
            let title = data.title,
            let price = data.price,
            let thumbnail = data.thumbnail else {
                LocalLogger.register(model: LogModel(level: .error, data: data, message: "Data corrupted, please check."))
                return nil
        }

        return ProductListResult(
            identifier: identifier,
            title: title,
            price: price,
            availableQuantity: data.availableQuantity ?? 0,
            thumbnail: thumbnail,
            freeShipping: data.shipping.freeShipping)
    }
}
