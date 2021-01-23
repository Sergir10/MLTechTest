//
//  ServiceError.swift
//  MLTechNetwork
//
//  Created by Sergio Giraldo on 23/01/21.
//  Copyright © 2021 Cebollitas. All rights reserved.
//

import Foundation

public enum ServiceError: Error {
    case invalidPath(message: String)
    case invalidParams(message: String)
    case serverError(response: Any)
    case decodeError(error: Error)
}
