//
//  ProductWrapper.swift
//  ProductDetail
//
//  Created by Sergio Giraldo on 27/01/21.
//  Copyright © 2021 Cebollitas. All rights reserved.
//

import MLTechCore

struct ProductWrapper: CoreWrapperType {
    static func map(_ apiData: APIProduct) throws -> Product {
        guard let identifier = apiData.identifier,
            let title = apiData.title,
            let price = apiData.price,
            let currencyId = apiData.currencyId,
            let condition = apiData.condition,
            let permalink = apiData.permalink,
            let pictures = apiData.pictures,
            let attributes = apiData.attributes else {
                LocalLogger.register(model: LogModel(level: .error, data: apiData, message: "Data corrupted, please check."))
                throw CoreWrapperError.requiredValueNotFound(description: "Required value came nil: \(apiData)")
        }

        return Product(
            identifier: identifier,
            title: title,
            subtitle: apiData.subtitle,
            price: price,
            currencyId: currencyId,
            condition: condition,
            permalink: permalink,
            pictures: try pictures.map { try PictureWrapper.map($0) },
            acceptsMercadoPago: apiData.acceptsMercadoPago ?? false,
            shipping: CoreShipping(freeShipping: apiData.shipping.freeShipping),
            attributes: try attributes.map { try AttributesWrapper.map($0) },
            warranty: apiData.warranty ?? "No especificada.")
    }
}
