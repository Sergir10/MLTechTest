//
//  BaseWrapper.swift
//  MLTechCore
//
//  Created by Sergio Giraldo on 24/01/21.
//  Copyright © 2021 Cebollitas. All rights reserved.
//

import Foundation

public protocol CoreWrapperType {
    associatedtype APIData: Codable
    associatedtype CoreData

    static func map(_ apiData: APIData) throws -> CoreData
}
