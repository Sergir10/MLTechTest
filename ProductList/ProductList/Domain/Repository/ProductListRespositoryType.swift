//
//  ProductListRespositoryType.swift
//  ProductList
//
//  Created by Sergio Giraldo on 24/01/21.
//  Copyright © 2021 Cebollitas. All rights reserved.
//

import Combine
import MLTechNetwork
import MLTechCore

protocol ProductListRespositoryType: AnyObject {
    func searchProduct(by query: String, page: CorePaginate?) -> AnyPublisher<ProductList, ServiceError>
}
