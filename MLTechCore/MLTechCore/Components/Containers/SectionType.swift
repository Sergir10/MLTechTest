//
//  SectionType.swift
//  MLTechCore
//
//  Created by Sergio Giraldo on 24/01/21.
//  Copyright © 2021 Cebollitas. All rights reserved.
//

import Foundation

public protocol SectionType: Hashable {
    associatedtype DataType: Equatable & Hashable
    
    var title: String { get }
    var data: [DataType] { get }
}
