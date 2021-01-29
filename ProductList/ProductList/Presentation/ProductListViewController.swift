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
        super.viewDidLoad()
        initialSetup()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }

    private func initialSetup() {
        customView.searchProductBar.delegate = self
        collectionViewDataSource = ProductCollectionViewDataSource(
            collectionView: customView.productCollectionView,
            sections: [],
            delegate: self,
            isLoadMoreHidden: false)
    }
}

extension ProductListViewController: ProductListViewControllerType {
    func showProduct(_ productSection: ProductListSectionViewModel) {
        collectionViewDataSource.sections = [productSection]
    }

    func showEmptyState(_ productSection: ProductListSectionViewModel, message: String) {
        collectionViewDataSource.sections = [productSection]
        customView.hideSearchView(hide: false, from: view)
        customView.searchComponent.setDescription(message)
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

    func didSelectItem(at indexPath: IndexPath) {
        presenter.selectedItem(at: indexPath)
    }

    func loadMore() {
        presenter.loadMoreReached()
    }
    
    func showCollectionFooter() {
        collectionViewDataSource.isLoadMoreHidden = false
    }
    
    func hideCollectionFooter() {
        collectionViewDataSource.isLoadMoreHidden = true
    }
}
