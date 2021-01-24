//
//  ApplicationCoordinatorSpy.swift
//  MLApplicationTests
//
//  Created by Sergio Giraldo on 24/01/21.
//  Copyright © 2021 Cebollitas. All rights reserved.
//

import MLTechCore

final class ApplicationCoordinatorSpy: ApplicationCoordinatorType {
    var runProductListModuleCallBack: (() -> Void)?
    var runProductDetailModuleCallBack: (() -> Void)?

    func runProductListModule() {
        runProductListModuleCallBack?()
    }

    func runProductDetailModule() {
        runProductDetailModuleCallBack?()
    }

    func start() {
        preconditionFailure("Implement this to use it.")
    }

    func childDeinitialized(_: CoordinatorType) {
        preconditionFailure("Implement this to use it.")
    }
}
