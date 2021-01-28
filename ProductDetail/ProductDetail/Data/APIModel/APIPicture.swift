//
//  APIPicture.swift
//  ProductDetail
//
//  Created by Sergio Giraldo on 27/01/21.
//  Copyright © 2021 Cebollitas. All rights reserved.
//

import Foundation

struct APIPicture: Codable {
    let identifier: String?
    let url: String?
    let secureUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case identifier = "id"
        case secureUrl = "secure_url"
        case url
    }
}
