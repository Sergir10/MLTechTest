//
//  ItemCellSelectable.swift
//  MLTechCore
//
//  Created by Sergio Giraldo on 27/01/21.
//  Copyright © 2021 Cebollitas. All rights reserved.
//

import Foundation

public protocol ItemCellSelectable: AnyObject {
    func didSelectItem(at indexPath: IndexPath)
}
