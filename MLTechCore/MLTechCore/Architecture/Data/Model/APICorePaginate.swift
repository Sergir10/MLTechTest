//
//  APIPaginate.swift
//  MLTechCore
//
//  Created by Sergio Giraldo on 24/01/21.
//  Copyright © 2021 Cebollitas. All rights reserved.
//

import Foundation

public struct APICorePaginate: Codable {
    public let total: Int
    public let primaryResults: Int
    public let offset: Int
    public let limit: Int

    public init(total: Int, primaryResults: Int, offset: Int, limit: Int) {
        self.total = total
        self.primaryResults = primaryResults
        self.offset = offset
        self.limit = limit
    }

    enum CodingKeys: String, CodingKey {
        case primaryResults = "primary_results"
        case total, offset, limit
    }
}
