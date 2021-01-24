//
//  LocalLogger.swift
//  MLTechCore
//
//  Created by Sergio Giraldo on 23/01/21.
//  Copyright © 2021 Cebollitas. All rights reserved.
//

import Foundation
import os

public struct LocalLogger {
    public static func register(model: LogModel) {
        let readableDate = Date().readableFormat("yyyy-MM-dd HH:mm:ss")
        let dataString = "\(model.data ?? "")"

        var messageToLog = "LOGGER: "
        messageToLog += "\(model.level.rawValue) \(readableDate): "
        messageToLog += "[\(sourceFileName(filePath: model.file)): \(model.line) \(model.function)] -> "
        messageToLog += "\(dataString) \(model.message)"

        log(level: model.level.value, message: messageToLog)
    }

    private static func log(level: OSLogType, message: String) {
        if #available(iOS 14, *) {
            Logger().log(level: level, "\(message)")
        } else {
            os_log("%@", type: level, message)
        }
    }

    private static func sourceFileName(filePath: String) -> String {
        let components = filePath.components(separatedBy: "/")
        return components.last ?? ""
    }
}
