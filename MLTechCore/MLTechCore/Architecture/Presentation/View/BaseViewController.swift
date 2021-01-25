//
//  BaseViewController.swift
//  MLTechTest
//
//  Created by Sergio Giraldo on 23/01/21.
//  Copyright © 2021 Cebollitas. All rights reserved.
//

import UIKit

open class BaseViewController<PresenterType, ViewType>: UIViewController, BaseViewControllerType {
    public var presenter: PresenterType
    public var customView: ViewType {
        view as! ViewType
    }

    private var bindablePresenter: Bindable {
        presenter as! Bindable
    }

    // MARK: - Init
    public init(presenter: PresenterType) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle methods.
    open override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        bindablePresenter.bind(view: self)
        bindablePresenter.viewDidLoad()
    }

    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        bindablePresenter.viewWillAppear()
    }

    open override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        bindablePresenter.viewDidAppear()
    }

    open override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        bindablePresenter.viewWillDisappear()
    }

    open override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        bindablePresenter.viewDidDisappear()
    }
}
