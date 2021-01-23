//
//  BaseViewControllerType.swift
//  MLTechTest
//
//  Created by Sergio Giraldo on 23/01/21.
//  Copyright © 2021 Cebollitas. All rights reserved.
//


import UIKit

public protocol BaseViewControllerType: ViewControllerBindable {
    associatedtype PresenterType
    associatedtype ViewType
    
    var presenter: PresenterType { get }
    var customView: ViewType { get }
}
