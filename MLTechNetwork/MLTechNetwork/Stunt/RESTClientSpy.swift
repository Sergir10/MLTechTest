//
//  RESTClientSpy.swift
//  MLTechNetwork
//
//  Created by Sergio Giraldo on 24/01/21.
//  Copyright © 2021 Cebollitas. All rights reserved.
//

import Combine
import Foundation

final class RESTClientSpy: RESTClientType {
    var baseURL: String = "baseURL"
    var requestToCallBack: ((RESTEndpointType, Codable.Type) -> Void)?

    func requestTo<Response>(endpoint: RESTEndpointType, model: Response.Type) -> AnyPublisher<Response, ServiceError> {
        requestToCallBack!(endpoint, model as! Codable.Type)
        return Fail<Response, ServiceError>(error: ServiceError.serverError(response: "Error")).eraseToAnyPublisher()
    }
}
