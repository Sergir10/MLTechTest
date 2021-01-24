//
//  ApplicationViewController.swift
//  MLApplication
//
//  Created Sergio Giraldo on 23/01/21.
//  Copyright © 2021 Cebollitas. All rights reserved.
//

import MLTechCore

final class ApplicationViewController: BaseViewController<ApplicationPresenterType, ApplicationViewType> {
    override func loadView() {
        view = ApplicationView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ApplicationViewController: ApplicationViewControllerType {}
