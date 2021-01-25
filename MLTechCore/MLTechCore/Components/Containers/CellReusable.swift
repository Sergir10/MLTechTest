//
//  CellReusable.swift
//  MLTechCore
//
//  Created by Sergio Giraldo on 24/01/21.
//  Copyright © 2021 Cebollitas. All rights reserved.
//

import Foundation

public protocol CellReusable {
    static var reuseIdentifier: String { get }
}

public extension CellReusable {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
