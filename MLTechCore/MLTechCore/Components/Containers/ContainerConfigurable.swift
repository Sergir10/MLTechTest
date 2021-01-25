//
//  ContainerConfigurable.swift
//  MLTechCore
//
//  Created by Sergio Giraldo on 24/01/21.
//  Copyright © 2021 Cebollitas. All rights reserved.
//

import Foundation

public protocol ContainerConfigurable {
    associatedtype U: CellConfigurable
    associatedtype T: SectionType

    var sections: [T] { get }
}
