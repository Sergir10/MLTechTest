//
//  AlertControllerBuilder.swift
//  MLTechCore
//
//  Created by Sergio Giraldo on 28/01/21.
//  Copyright © 2021 Cebollitas. All rights reserved.
//

import UIKit

public protocol AlertControllerBuilderType {
    associatedtype Controller: UIViewController
    func add(element: NSObject) -> Self
    func build() -> Controller
}

public class AlertControllerBuilder: AlertControllerBuilderType {
    var alertController: UIAlertController

    public init(preferredStyle: UIAlertController.Style = .alert) {
        alertController = UIAlertController(title: "", message: "", preferredStyle: preferredStyle)
    }

    public func add(element: NSObject) -> Self {
        guard let item = element as? UIAlertAction else {
            LocalLogger.register(model: LogModel(level: .info, data: element))
            return self
        }

        alertController.addAction(item)
        return self
    }

    public func build() -> UIAlertController {
        return alertController
    }

    @discardableResult
    public func with(title: String) -> Self {
        alertController.title = title
        return self
    }

    @discardableResult
    public func with(message: String) -> Self {
        alertController.message = message
        return self
    }

    @discardableResult
    public func cancelOption(title: String = "Cancelar", handleAction: @escaping () -> Void = {}) -> Self {
        return createOption(title: title, style: .cancel, handleAction: handleAction)
    }

    @discardableResult
    public func createOption(title: String, style: UIAlertAction.Style = .default, handleAction: (() -> Void)?) -> Self {
        let option = UIAlertAction(
            title: title,
            style: style) { _ in
            handleAction?()
            self.alertController.dismiss(animated: true, completion: nil)
        }

        return add(element: option)
    }
}
