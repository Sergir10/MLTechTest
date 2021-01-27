//
//  ProductListSectionViewModel.swift
//  ProductList
//
//  Created by Sergio Giraldo on 24/01/21.
//  Copyright © 2021 Cebollitas. All rights reserved.
//

import MLTechCore
import Foundation

struct ProductListSectionViewModel: SectionType {
    var identifier: UUID = UUID()
    var title: String
    var data: [ProducListCellViewModel]
}
