//
//  RESTEndpoint.swift
//  MLTechNetwork
//
//  Created by Sergio Giraldo on 23/01/21.
//  Copyright © 2021 Cebollitas. All rights reserved.
//

public struct RESTEndpoint: RESTEndpointType {
    public var method: RESTMethod
    public var relativePath: String
    public var params: [String: Any]?
    public var contentType: RESTContentType

    public init(method: RESTMethod, relativePath: String, params: [String: Any]?, contentType: RESTContentType = .json) {
        self.method = method
        self.relativePath = relativePath
        self.params = params
        self.contentType = contentType
    }
}
