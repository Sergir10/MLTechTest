//
//  ProductListViewController.swift
//  ProductList
//
//  Created Sergio Giraldo on 24/01/21.
//  Copyright © 2021 Cebollitas. All rights reserved.
//

import MLTechCore
import UIKit

final class ProductListViewController: BaseViewController<ProductListPresenterType, ProductListViewType> {
    private var collectionViewDataSource: ProductCollectionViewDataSource!

    override func loadView() {
        view = ProductListView()
    }

    override func viewDidLoad() {
        initialSetup()
        super.viewDidLoad()
    }

    private func initialSetup() {
        customView.searchProductBar.delegate = self
        collectionViewDataSource = ProductCollectionViewDataSource(
            collectionView: customView.productCollectionView,
            sections: [])
    }
}

extension ProductListViewController: ProductListViewControllerType {
    func showProduct(_ productSections: [ProductListSectionViewModel]) {
        collectionViewDataSource.sections = productSections
    }
    
    func setDescriptionTitle(_ title: String) {
        customView.descriptionLabel.text = title
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let query = searchBar.text else {
            return
        }

        customView.searchProductBar.resignFirstResponder()
        presenter.searchBarSearchButtonClicked(with: query)
        customView.hideBackgroundView(hide: true, from: view)
        customView.hideSearchView(hide: true, from: view)
    }

    func searchBarTextDidBeginEditing(_: UISearchBar) {
        customView.searchProductBar.setShowsCancelButton(true, animated: true)
        customView.hideBackgroundView(hide: false, from: customView.searchBackgroundView)
    }

    func searchBarCancelButtonClicked(_: UISearchBar) {
        customView.searchProductBar.setShowsCancelButton(false, animated: true)
        customView.searchProductBar.text = ""
        customView.searchProductBar.resignFirstResponder()
        customView.hideBackgroundView(hide: true, from: view)
    }
}
