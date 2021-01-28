//
//  NumberFormatter+Extension.swift
//  MLTechCore
//
//  Created by Sergio Giraldo on 28/01/21.
//  Copyright © 2021 Cebollitas. All rights reserved.
//

import Foundation

public extension NSNumber {
    func toLocalCurrency() -> String? {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency

        return formatter.string(from: self)
    }
}
