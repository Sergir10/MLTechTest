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
    func showProduct(_ productSection: ProductListSectionViewModel)
    func showEmptyState(_ productSection: ProductListSectionViewModel, message: String)
    func setDescriptionTitle(_ title: String)
}

protocol ProductListPresenterType: Bindable {
    func searchBarSearchButtonClicked(with text: String)
}

protocol ProductListViewType: UIView {
    var productCollectionView: UICollectionView { get }
    var searchProductBar: UISearchBar { get }
    var searchBackgroundView: UIView { get }
    var descriptionLabel: UILabel { get }
    var searchComponent: SearchComponentViewType { get }

    func hideBackgroundView(hide: Bool, from view: UIView)
    func hideSearchView(hide: Bool, from view: UIView)
}
