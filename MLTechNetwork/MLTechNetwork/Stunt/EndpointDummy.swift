//
//  EndpointDummy.swift
//  MLTechNetwork
//
//  Created by Sergio Giraldo on 24/01/21.
//  Copyright © 2021 Cebollitas. All rights reserved.
//

import Foundation

struct EndpointDummy: RESTEndpointType {
    var method: RESTMethod
    var relativePath: String
    var params: [String: Any]?
    var contentType: RESTContentType

    init() {
        method = .get
        relativePath = ""
        contentType = .json
    }
}
