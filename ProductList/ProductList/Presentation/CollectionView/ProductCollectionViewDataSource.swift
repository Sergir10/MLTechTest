//
//  ProductCollectionViewDataSource.swift
//  ProductList
//
//  Created by Sergio Giraldo on 24/01/21.
//  Copyright © 2021 Cebollitas. All rights reserved.
//

import MLTechCore
import UIKit

final class ProductCollectionViewDataSource: BaseCollectionView<ProductListSectionViewModel, ProducListCollectionViewCell> {
    private struct Constants {
        static let footerElementKind = "footerElementKind"
    }

    init(collectionView: UICollectionView, sections: [ProductListSectionViewModel], delegate: CollectionViewDelegate) {
        super.init(collectionView: collectionView, sections: sections, delegate: delegate)
        customSetup()
    }

    private func customSetup() {
        collectionView.register(
            LoadMoreSupplementaryView.self,
            forSupplementaryViewOfKind: Constants.footerElementKind,
            withReuseIdentifier: LoadMoreSupplementaryView.reuseIdentifier)

        setupSuplementaryView()
        collectionView.collectionViewLayout = createLayout()
    }

    private func setupSuplementaryView() {
        dataSource.supplementaryViewProvider = { (collectionView: UICollectionView, kind: String, indexPath: IndexPath) -> UICollectionReusableView? in
            if let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: LoadMoreSupplementaryView.reuseIdentifier, for: indexPath) as? LoadMoreSupplementaryView {
                /// This logic show the activity indicator when there are data, when is empty then the activity is hidden.
                if self.sections[indexPath.section].data.isEmpty {
                    footerView.activityIndicatorView.isHidden = true
                    footerView.activityIndicatorView.stopAnimating()
                } else {
                    footerView.activityIndicatorView.isHidden = false
                    footerView.activityIndicatorView.startAnimating()
                    self.delegate?.loadMore()
                }

                return footerView
            }

            preconditionFailure()
        }
    }

    /// Create the grid layout for Collection view when we want to show Footer.
    /// - Returns: UICollectionViewLayout
    private func createLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(100))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

        let footerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(50))
        let footer = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: footerSize, elementKind: Constants.footerElementKind, alignment: .bottom)

        let section = NSCollectionLayoutSection(group: group)
        section.boundarySupplementaryItems = [footer]
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }

    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 100)
    }
}
