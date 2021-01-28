//
//  APIProduct.swift
//  ProductDetail
//
//  Created by Sergio Giraldo on 27/01/21.
//  Copyright © 2021 Cebollitas. All rights reserved.
//

import MLTechCore

struct APIProduct: Codable {
    let identifier: String?
    let title: String?
    let subtitle: String?
    let price: Double?
    let currencyId: String?
    let condition: String?
    let permalink: String?
    let pictures: [APIPicture]?
    let acceptsMercadoPago: Bool?
    let shipping: APICoreShipping
    let attributes: [APIAttributes]?
    let warranty: String?
    
    enum CodingKeys: String, CodingKey {
        case identifier = "id"
        case currencyId = "currency_id"
        case acceptsMercadoPago = "accepts_mercadopago"
        case title, subtitle, price, condition, permalink, pictures, shipping, attributes, warranty
    }
}
