//
//  ProductListView.swift
//  ProductList
//
//  Created Sergio Giraldo on 24/01/21.
//  Copyright © 2021 Cebollitas. All rights reserved.
//

import MLTechCore
import UIKit

final class ProductListView: UIView, ProductListViewType {
    lazy var productCollectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: self.layout)
        view.backgroundColor = .gray
        view.showsHorizontalScrollIndicator = false
        view.isPagingEnabled = false

        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal

        return layout
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        initialSetup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func initialSetup() {
        addSubview(productCollectionView)

        setupConstraints()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            productCollectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            productCollectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -10),
            productCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            productCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])
    }
}
