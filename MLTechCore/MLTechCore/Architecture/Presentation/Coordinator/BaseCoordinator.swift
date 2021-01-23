//
//  BaseCoordinator.swift
//  MLTechTest
//
//  Created by Sergio Giraldo on 23/01/21.
//  Copyright © 2021 Cebollitas. All rights reserved.
//

import UIKit

open class BaseCoordinator<ParentCoordinator: CoordinatorType>: CoordinatorType {
    public var parentCoordinator: ParentCoordinator?

    public init(parentCoordinator: ParentCoordinator? = nil) {
        self.parentCoordinator = parentCoordinator
    }

    open func start() {}

    public func childDeinitialized(_ child: CoordinatorType) {
        print(child)
    }

    deinit {
        parentCoordinator?.childDeinitialized(self)
    }
}
