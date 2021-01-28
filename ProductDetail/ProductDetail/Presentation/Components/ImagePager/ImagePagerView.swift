//
//  ImagePagerView.swift
//  ProductDetail
//
//  Created by Sergio Giraldo on 28/01/21.
//  Copyright © 2021 Cebollitas. All rights reserved.
//

import MLTechCore
import UIKit

protocol ImagePagerViewType: UIView {
    var collectionView: UICollectionView { get }
    var pagerControl: UIPageControl { get }
}

final class ImagePagerView: UIView, ImagePagerViewType {
    private lazy var imagePagerContainerView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .white

        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var collectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: self.layout)
        view.backgroundColor = .white
        view.showsHorizontalScrollIndicator = false
        view.isPagingEnabled = true

        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal

        return layout
    }()

    lazy var pagerControl: UIPageControl = {
        let control = UIPageControl(frame: .zero)
        control.pageIndicatorTintColor = .black
        control.currentPageIndicatorTintColor = Theme.Color.primary

        control.translatesAutoresizingMaskIntoConstraints = false
        return control
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        initialSetup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func initialSetup() {
        setupImagePagerContainerView()
        setupImagePagerComponent()
    }

    private func setupImagePagerContainerView() {
        addSubview(imagePagerContainerView)

        NSLayoutConstraint.activate([
            imagePagerContainerView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            imagePagerContainerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            imagePagerContainerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            imagePagerContainerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
        ])
    }

    private func setupImagePagerComponent() {
        imagePagerContainerView.addSubview(collectionView)
        imagePagerContainerView.addSubview(pagerControl)

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: imagePagerContainerView.topAnchor, constant: 10),
            collectionView.leadingAnchor.constraint(equalTo: imagePagerContainerView.leadingAnchor, constant: 15),
            collectionView.trailingAnchor.constraint(equalTo: imagePagerContainerView.trailingAnchor, constant: -15),
            collectionView.bottomAnchor.constraint(equalTo: imagePagerContainerView.bottomAnchor, constant: -40),

            pagerControl.bottomAnchor.constraint(equalTo: imagePagerContainerView.bottomAnchor, constant: -10),
            pagerControl.centerXAnchor.constraint(equalTo: imagePagerContainerView.centerXAnchor),
        ])
    }
}
