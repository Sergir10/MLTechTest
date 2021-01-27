//
//  ProductListContract.swift
//  ProductList
//
//  Created Sergio Giraldo on 24/01/21.
//  Copyright © 2021 Cebollitas. All rights reserved.
//

import MLTechCore
import UIKit

protocol ProductListViewControllerType: AnyObject, UISearchBarDelegate {
    func showProduct(_ productSections: [ProductListSectionViewModel])
}

protocol ProductListPresenterType: Bindable {}

protocol ProductListViewType: UIView {
    var productCollectionView: UICollectionView { get }
    var searchProductBar: UISearchBar { get }
} 
