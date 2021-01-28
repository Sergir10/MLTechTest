//
//  ProductDetailRepositoryType.swift
//  ProductDetail
//
//  Created by Sergio Giraldo on 27/01/21.
//  Copyright © 2021 Cebollitas. All rights reserved.
//

import Combine
import MLTechNetwork

protocol ProductDetailRepositoryType: AnyObject {
    func product(by id: String) -> AnyPublisher<Product, ServiceError>
}
