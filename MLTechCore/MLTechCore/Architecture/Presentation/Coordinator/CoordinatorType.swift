//
//  CoordinatorType.swift
//  MLTechTest
//
//  Created by Sergio Giraldo on 23/01/21.
//  Copyright © 2021 Cebollitas. All rights reserved.
//

import UIKit

public protocol CoordinatorType: AnyObject {
    func start()
    func childDeinitialized(_ child: CoordinatorType)
}
