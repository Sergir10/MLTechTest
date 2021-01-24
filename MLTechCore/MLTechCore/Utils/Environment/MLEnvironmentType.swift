//
//  MLEnvironmentType.swift
//  MLTechTest
//
//  Created by Sergio Giraldo on 23/01/21.
//  Copyright © 2021 Cebollitas. All rights reserved.
//

import Foundation

public enum EnvironmentType: String {
    case debug
    case release

    public var baseURL: String {
        InfoDictionary.baseURL[rawValue]!
    }
}

struct InfoDictionary {
    private static let dictionary = Bundle.main.infoDictionary!

    static var baseURL: [String: String] {
        return dictionary["BaseURL"] as! [String: String]
    }
}
