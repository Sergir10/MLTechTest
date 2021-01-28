//
//  ProductDetailView.swift
//  ProductDetail
//
//  Created Sergio Giraldo on 27/01/21.
//  Copyright © 2021 Cebollitas. All rights reserved.
//

import MLTechCore
import UIKit

final class ProductDetailView: UIView, ProductDetailViewType {
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

    private lazy var componentStackView: UIStackView = {
        let view = UIStackView(frame: .zero)
        view.backgroundColor = .white
        view.distribution = .fill
        view.alignment = .fill
        view.spacing = 5
        view.axis = .vertical

        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var imagePagerComponentView: ImagePagerViewType = {
        let view = ImagePagerView(frame: .zero)
        view.backgroundColor = .white
        view.heightAnchor.constraint(equalToConstant: 300).isActive = true

        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var conditionLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont.systemFont(ofSize: 12, weight: .light)
        view.textColor = .lightGray

        return view
    }()

    lazy var titleLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        view.numberOfLines = 0

        return view
    }()

    lazy var priceLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 0
        label.textColor = .black
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont.systemFont(ofSize: 30, weight: .medium)

        return label
    }()

    lazy var productInformationComponent: ProductInformationViewType = {
        let view = ProductInformationView(frame: .zero)
        view.backgroundColor = .white

        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        initialSetup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func initialSetup() {
        setupComponentStackView()
        setupConditionLabel()
        setupTitleLabel()
        setupImagePagerComponentView()
        setupPriceLabel()
        setupProductInformation()
        setupContainerView()
        setupScrollContainerView()
    }

    private func setupScrollContainerView() {
        addSubview(containerScrollView)

        NSLayoutConstraint.activate([
            containerScrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            containerScrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -10),
            containerScrollView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 10),
            containerScrollView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -10),
        ])
    }

    private func setupContainerView() {
        containerScrollView.addSubview(containerView)
        let heightConstraint = containerView.heightAnchor.constraint(equalTo: containerScrollView.heightAnchor)
        heightConstraint.priority = .defaultLow

        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: containerScrollView.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: containerScrollView.bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: containerScrollView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: containerScrollView.trailingAnchor),
            containerView.widthAnchor.constraint(equalTo: containerScrollView.widthAnchor),
            heightConstraint,
        ])
    }

    private func setupComponentStackView() {
        containerView.addSubview(componentStackView)

        NSLayoutConstraint.activate([
            componentStackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
            componentStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            componentStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
            componentStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
        ])
    }

    private func setupConditionLabel() {
        componentStackView.addArrangedSubview(conditionLabel)
    }

    private func setupTitleLabel() {
        componentStackView.addArrangedSubview(titleLabel)
    }

    private func setupImagePagerComponentView() {
        componentStackView.addArrangedSubview(imagePagerComponentView)
    }

    private func setupPriceLabel() {
        componentStackView.addArrangedSubview(priceLabel)
    }

    private func setupProductInformation() {
        componentStackView.addArrangedSubview(productInformationComponent)
    }
}
