//
//  ProductRespositoryType.swift
//  ProductList
//
//  Created by Sergio Giraldo on 24/01/21.
//  Copyright © 2021 Cebollitas. All rights reserved.
//

import Combine
import MLTechNetwork

protocol ProductRespositoryType: AnyObject {
    func searchProduct(by query: String) -> AnyPublisher<ProductList, ServiceError>
}
