//
//  MLEnvironment.swift
//  MLTechTest
//
//  Created by Sergio Giraldo on 23/01/21.
//  Copyright © 2021 Cebollitas. All rights reserved.
//

import Foundation

public struct MLEnvironment {
    public static let shared = MLEnvironment()

    public var selected: EnvironmentType {
        getEnvironment()
    }

    private init() {}

    private func getEnvironment() -> EnvironmentType {
        #if DEBUG
            return .debug
        #else
            return .release
        #endif
    }
}
