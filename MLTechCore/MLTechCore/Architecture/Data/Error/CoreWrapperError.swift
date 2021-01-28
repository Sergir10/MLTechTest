//
//  CoreWrapperError.swift
//  MLTechCore
//
//  Created by Sergio Giraldo on 27/01/21.
//  Copyright © 2021 Cebollitas. All rights reserved.
//

import Foundation

public enum CoreWrapperError: Error {
    case requiredValueNotFound(description: String)
}
