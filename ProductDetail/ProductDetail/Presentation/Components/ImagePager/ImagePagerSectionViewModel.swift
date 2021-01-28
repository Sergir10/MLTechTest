//
//  ImagePagerSectionViewModel.swift
//  ProductDetail
//
//  Created by Sergio Giraldo on 27/01/21.
//  Copyright © 2021 Cebollitas. All rights reserved.
//

import MLTechCore
import UIKit

struct ImagePagerSectionViewModel: SectionType {
    var identifier: UUID = UUID()
    var title: String
    var data: [ImagePagerCellViewModel]
}
