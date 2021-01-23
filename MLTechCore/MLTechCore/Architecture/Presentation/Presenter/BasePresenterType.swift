//
//  BasePresenterType.swift
//  MLTechTest
//
//  Created by Sergio Giraldo on 23/01/21.
//  Copyright © 2021 Cebollitas. All rights reserved.
//


import UIKit

public protocol BasePresenterType: Bindable {
    associatedtype ViewController: AnyObject
    associatedtype ViewControllerType
    
    var view: ViewControllerType { get }
}

public protocol Bindable: LifeCycleNotifiable {
    func bind<T: ViewControllerBindable>(view: T)
}

public protocol LifeCycleNotifiable: AnyObject {
    func viewDidLoad()
    func viewWillAppear()
    func viewDidAppear()
    func viewWillDisappear()
    func viewDidDisappear()
}
