//
//  APIAttributes.swift
//  ProductDetail
//
//  Created by Sergio Giraldo on 27/01/21.
//  Copyright © 2021 Cebollitas. All rights reserved.
//

import Foundation

struct APIAttributes: Codable {
    let identifier: String?
    let name: String?
    let valueName: String?

    enum CodingKeys: String, CodingKey {
        case identifier = "id"
        case valueName = "value_name"
        case name
    }
}
