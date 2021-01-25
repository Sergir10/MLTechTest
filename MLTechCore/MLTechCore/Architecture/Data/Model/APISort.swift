//
//  APISort.swift
//  MLTechCore
//
//  Created by Sergio Giraldo on 24/01/21.
//  Copyright © 2021 Cebollitas. All rights reserved.
//

import Foundation

public struct APICoreSort: Codable {
    public let identifier: String
    public let name: String

    public init(identifier: String, name: String) {
        self.identifier = identifier
        self.name = name
    }
    
    enum CodingKeys: String, CodingKey {
        case identifier = "id"
        case name
    }
}
