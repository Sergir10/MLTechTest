//
//  BaseCoordinator.swift
//  MLTechTest
//
//  Created by Sergio Giraldo on 23/01/21.
//  Copyright © 2021 Cebollitas. All rights reserved.
//


import UIKit

open class BaseCoordinator<ParentCoordinator>: CoordinatorType {
    public var parentCoordinator: ParentCoordinator? = nil
    public var childCoordinators: [CoordinatorType] = []
    public var router: RouterType

    public init(router: RouterType, parentCoordinator: ParentCoordinator? = nil) {
        self.router = router
        self.parentCoordinator = parentCoordinator
    }

    open func start() {}

    public func addCoordinatorChild(_ coordinator: CoordinatorType) {
        for child in childCoordinators where child === coordinator {
            return
        }

        childCoordinators.append(coordinator)
    }
    
    public func removeCoordinatorChild(_ coordinator: CoordinatorType) {
        guard childCoordinators.isEmpty == false else { return }
        
        for (index, child) in childCoordinators.enumerated() where child === coordinator {
            childCoordinators.remove(at: index)
            break
        }
    }
}
