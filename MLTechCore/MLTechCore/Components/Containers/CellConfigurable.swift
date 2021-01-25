//
//  CellConfigurable.swift
//  MLTechCore
//
//  Created by Sergio Giraldo on 24/01/21.
//  Copyright © 2021 Cebollitas. All rights reserved.
//

import UIKit

public protocol CellConfigurable: AnyObject, CellReusable {
    associatedtype DataType: Hashable

    func configure(with data: DataType)
}
