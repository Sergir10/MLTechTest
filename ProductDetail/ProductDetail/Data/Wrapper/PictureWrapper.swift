//
//  PictureWrapper.swift
//  ProductDetail
//
//  Created by Sergio Giraldo on 27/01/21.
//  Copyright © 2021 Cebollitas. All rights reserved.
//

import MLTechCore

struct PictureWrapper: CoreWrapperType {
    static func map(_ apiData: APIPicture) throws -> Picture {
        guard let identifier = apiData.identifier,
            let url = apiData.url,
            let secureUrl = apiData.secureUrl else {
                LocalLogger.register(model: LogModel(level: .error, data: apiData, message: "Data corrupted, please check."))
                throw CoreWrapperError.requiredValueNotFound(description: "Required value came nil: \(apiData)")
        }

        return Picture(identifier: identifier, url: url, secureUrl: secureUrl)
    }
}
