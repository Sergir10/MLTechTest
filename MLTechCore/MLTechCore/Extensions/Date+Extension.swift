//
//  Date+Extension.swift
//  MLTechCore
//
//  Created by Sergio Giraldo on 23/01/21.
//  Copyright © 2021 Cebollitas. All rights reserved.
//

import Foundation

public extension Date {
    func readableFormat(_ format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatter.locale = Locale.current
        formatter.timeZone = TimeZone.current

        return formatter.string(from: self as Date)
    }
}
