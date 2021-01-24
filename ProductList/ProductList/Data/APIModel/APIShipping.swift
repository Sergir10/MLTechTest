//
//  APIShipping.swift
//  ProductList
//
//  Created by Sergio Giraldo on 24/01/21.
//  Copyright © 2021 Cebollitas. All rights reserved.
//

import Foundation

struct APIShipping: Codable {
    let freeShipping: Bool

    enum CodingKeys: String, CodingKey {
        case freeShipping = "free_shipping"
    }
}
