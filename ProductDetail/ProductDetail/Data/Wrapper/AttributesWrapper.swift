//
//  AttributesWrapper.swift
//  ProductDetail
//
//  Created by Sergio Giraldo on 27/01/21.
//  Copyright © 2021 Cebollitas. All rights reserved.
//

import MLTechCore

struct AttributesWrapper: CoreWrapperType {
    static func map(_ apiData: APIAttributes) throws -> Attributes {
        guard let identifier = apiData.identifier,
            let name = apiData.name,
            let value = apiData.valueName else {
                LocalLogger.register(model: LogModel(level: .error, data: apiData, message: "Data corrupted, please check."))
                throw CoreWrapperError.requiredValueNotFound(description: "Required value came nil: \(apiData)")
        }

        return Attributes(identifier: identifier, name: name, value: value)
    }
}
