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
    private lazy var containerScrollView: UIScrollView = {
        let view = UIScrollView(frame: .zero)
        view.isScrollEnabled = true
        view.showsVerticalScrollIndicator = false
        view.showsHorizontalScrollIndicator = false
        view.backgroundColor = .white

        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var containerView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .white

        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var navigationBarColor: UIView = {
        let view = UIView(frame: .zero)

        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var searchProductBar: UISearchBar = {
        let view = UISearchBar(frame: .zero)
        view.layer.borderWidth = 1
        view.searchBarStyle = .minimal
        view.layer.borderColor = UIColor.clear.cgColor
        view.searchTextField.backgroundColor = .white
        view.placeholder = "Buscar producto"
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    lazy var productCollectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: self.layout)
        view.backgroundColor = .white
        view.isPagingEnabled = false

        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()

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
        setupScrollContainerView()
        setupContainerView()
        setupSearchProductBar()
        setupProductCollectionView()
        setupNavigationBarColor()
    }

    private func setupScrollContainerView() {
        addSubview(containerScrollView)

        NSLayoutConstraint.activate([
            containerScrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            containerScrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -10),
            containerScrollView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 10),
            containerScrollView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -10),
        ])
    }

    private func setupContainerView() {
        containerScrollView.addSubview(containerView)

        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: containerScrollView.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: containerScrollView.bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: containerScrollView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: containerScrollView.trailingAnchor),
            containerView.heightAnchor.constraint(equalTo: containerScrollView.heightAnchor),
            containerView.widthAnchor.constraint(equalTo: containerScrollView.widthAnchor),
        ])
    }

    private func setupSearchProductBar() {
        containerView.addSubview(searchProductBar)

        NSLayoutConstraint.activate([
            searchProductBar.topAnchor.constraint(equalTo: containerView.topAnchor),
            searchProductBar.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            searchProductBar.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            searchProductBar.heightAnchor.constraint(equalToConstant: 50),
        ])
    }

    private func setupProductCollectionView() {
        containerView.addSubview(productCollectionView)

        NSLayoutConstraint.activate([
            productCollectionView.topAnchor.constraint(equalTo: searchProductBar.bottomAnchor),
            productCollectionView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            productCollectionView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            productCollectionView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
        ])
    }

    private func setupNavigationBarColor() {
        addSubview(navigationBarColor)
        sendSubviewToBack(navigationBarColor)

        NSLayoutConstraint.activate([
            navigationBarColor.topAnchor.constraint(equalTo: topAnchor),
            navigationBarColor.bottomAnchor.constraint(equalTo: searchProductBar.bottomAnchor),
            navigationBarColor.leadingAnchor.constraint(equalTo: leadingAnchor),
            navigationBarColor.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
}
