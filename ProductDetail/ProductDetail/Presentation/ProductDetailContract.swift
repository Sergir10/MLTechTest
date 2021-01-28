//
//  ProductDetailContract.swift
//  ProductDetail
//
//  Created Sergio Giraldo on 27/01/21.
//  Copyright © 2021 Cebollitas. All rights reserved.
//

import MLTechCore
import UIKit

protocol ProductDetailViewControllerType: AnyObject, ErrorShowable, ProgressShowable {
    func setupView(from model: Product)
    func setupImagePager(with sections: [ImagePagerSectionViewModel])
    func setupPrice(_ price: String)
    func setupProductInformation(_ information: [ProductInformationViewModel], title: String)
}

protocol ProductDetailPresenterType: Bindable {}

protocol ProductDetailViewType: UIView {
    var imagePagerComponentView: ImagePagerViewType { get }
    var conditionLabel: UILabel { get }
    var titleLabel: UILabel { get }
    var priceLabel: UILabel { get }
    var productInformationComponent: ProductInformationViewType { get }
}
