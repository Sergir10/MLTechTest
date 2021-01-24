//
//  BasePresenter.swift
//  MLTechTest
//
//  Created by Sergio Giraldo on 23/01/21.
//  Copyright © 2021 Cebollitas. All rights reserved.
//

import Combine
import UIKit

open class BasePresenter<ViewController: AnyObject, ViewControllerType>: BasePresenterType {
    private unowned var viewController: ViewController!

    public var subscriberCancellable = Set<AnyCancellable>()

    public var view: ViewControllerType {
        viewController as! ViewControllerType
    }

    public func bind<T>(view: T) where T: ViewControllerBindable {
        guard let viewType = view as? ViewController else {
            fatalError("Object `\(ViewController.self)` passed from: \(self) isn't equal to: \(view)")
        }

        viewController = viewType
    }

    public init() {}

    // MARK: - These methods could be overridden as needed.
    open func viewDidLoad() {}

    open func viewWillAppear() {}

    open func viewDidAppear() {}

    open func viewWillDisappear() {}

    open func viewDidDisappear() {}
}
