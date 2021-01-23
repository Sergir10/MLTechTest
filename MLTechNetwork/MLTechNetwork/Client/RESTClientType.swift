//
//  RESTClientType.swift
//  MLTechNetwork
//
//  Created by Sergio Giraldo on 23/01/21.
//  Copyright © 2021 Cebollitas. All rights reserved.
//

import Combine

public protocol RESTClientType: AnyObject {
    var baseURL: String { get }

    func requestTo<Response: Codable>(endpoint: RESTEndpoint<Response>) -> AnyPublisher<Response, ServiceError>
}
