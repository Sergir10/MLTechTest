//
//  Product.swift
//  ProductDetail
//
//  Created by Sergio Giraldo on 27/01/21.
//  Copyright © 2021 Cebollitas. All rights reserved.
//

import MLTechCore

struct Product {
    let identifier: String
    let title: String
    let subtitle: String?
    let price: Double
    let currencyId: String
    let condition: String
    let permalink: String
    let pictures: [Picture]
    let acceptsMercadoPago: Bool
    let shipping: CoreShipping
    let attributes: [Attributes]
    let warranty: String
}
