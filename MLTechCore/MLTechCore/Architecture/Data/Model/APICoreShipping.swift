//
//  APICoreShipping.swift
//  MLTechCore
//
//  Created by Sergio Giraldo on 27/01/21.
//  Copyright © 2021 Cebollitas. All rights reserved.
//

import Foundation

public struct APICoreShipping: Codable {
    public let freeShipping: Bool
    
    public init(freeShipping: Bool) {
        self.freeShipping = freeShipping
    }

    enum CodingKeys: String, CodingKey {
        case freeShipping = "free_shipping"
    }
}
