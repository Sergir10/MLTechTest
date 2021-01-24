//
//  ProductListRespositoryType.swift
//  ProductList
//
//  Created by Sergio Giraldo on 24/01/21.
//  Copyright © 2021 Cebollitas. All rights reserved.
//

import Combine
import MLTechNetwork

protocol ProductListRespositoryType: AnyObject {
    func searchProduct(by query: String) -> AnyPublisher<String, ServiceError>
}
