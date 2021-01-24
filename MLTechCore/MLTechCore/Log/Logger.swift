//
//  Logger.swift
//  MLTechCore
//
//  Created by Sergio Giraldo on 23/01/21.
//  Copyright © 2021 Cebollitas. All rights reserved.
//

import Foundation
import os

public enum LogLevel: String {
    case debug = "[🐞 Debug]"
    case info = "[ℹ️ Information]"
    case error = "[⛔️ Error]"
    case fault = "[⚠️ Fault]"
    case notice = "[📌 Notice]"

    var value: OSLogType {
        switch self {
        case .debug: return .debug
        case .info: return .info
        case .error: return .error
        case .fault: return .fault
        case .notice: return .default
        }
    }
}

public struct LogModel {
    var level: LogLevel
    var data: Any?
    var message: String = ""
    var file: String = #file
    var line: Int = #line
    var function: String = #function

    public init(level: LogLevel, data: Any?, message: String = "", file: String = #file, line: Int = #line, function: String = #function) {
        self.level = level
        self.data = data
        self.message = message
        self.file = file
        self.line = line
        self.function = function
    }
}

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
