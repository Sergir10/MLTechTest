//
//  SearchComponentView.swift
//  ProductList
//
//  Created by Sergio Giraldo on 26/01/21.
//  Copyright © 2021 Cebollitas. All rights reserved.
//

import UIKit

protocol SearchComponentViewType: UIView {
    func setImage(_ image: UIImage)
    func setTitle(_ title: String)
    func setDescription(_ description: String)
}

final class SearchComponentView: UIView {
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
        view.alignment = .center
        view.spacing = 5
        view.axis = .vertical

        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var searchImageView: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.contentMode = .scaleAspectFit
        view.image = UIImage(systemName: "magnifyingglass.circle.fill")
        view.tintColor = .gray

        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var titleLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont.systemFont(ofSize: 16, weight: .bold)

        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var descriptionLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        view.numberOfLines = 0

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
        setupContainerView()
        setupComponentStackView()
        setupSearchImageView()
        setupTitleDescriptionLabel()
    }

    private func setupContainerView() {
        addSubview(containerView)

        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }

    private func setupComponentStackView() {
        containerView.addSubview(componentStackView)

        NSLayoutConstraint.activate([
            componentStackView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            componentStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            componentStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            componentStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
        ])
    }

    private func setupSearchImageView() {
        componentStackView.addArrangedSubview(searchImageView)

        NSLayoutConstraint.activate([
            searchImageView.heightAnchor.constraint(equalToConstant: 100),
            searchImageView.widthAnchor.constraint(equalToConstant: 100),
        ])
    }

    private func setupTitleDescriptionLabel() {
        componentStackView.addArrangedSubview(titleLabel)
        componentStackView.addArrangedSubview(descriptionLabel)
    }
}

extension SearchComponentView: SearchComponentViewType {
    func setImage(_ image: UIImage) {
        searchImageView.image = image
    }

    func setTitle(_ title: String) {
        titleLabel.text = title
    }

    func setDescription(_ description: String) {
        descriptionLabel.text = description
    }
}
