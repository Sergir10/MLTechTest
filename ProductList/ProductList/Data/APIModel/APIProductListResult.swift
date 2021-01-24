//
//  APIProductListResult.swift
//  ProductList
//
//  Created by Sergio Giraldo on 24/01/21.
//  Copyright © 2021 Cebollitas. All rights reserved.
//

import Foundation

struct APIProductListResult: Codable {
    let identifier: String
    let title: String
    let price: Int
    let availableQuantity: Int
    let thumbnail: String
    let shipping: APIShipping

    enum CodingKeys: String, CodingKey {
        case identifier = "id"
        case availableQuantity = "available_quantity"
        case title, price, thumbnail, shipping
    }
}
