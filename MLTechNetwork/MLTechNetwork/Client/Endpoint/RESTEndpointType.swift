//
//  RESTEndpointType.swift
//  MLTechNetwork
//
//  Created by Sergio Giraldo on 23/01/21.
//  Copyright © 2021 Cebollitas. All rights reserved.
//

import Foundation

public protocol RESTEndpointType {
    var method: RESTMethod { get }
    var relativePath: String { get }
    var params: [String: Any]? { get }
    var contentType: RESTContentType { get }
}
