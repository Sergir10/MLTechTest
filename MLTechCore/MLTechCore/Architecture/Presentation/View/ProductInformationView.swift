//
//  ProductInformationView.swift
//  ProductDetail
//
//  Created by Sergio Giraldo on 28/01/21.
//  Copyright © 2021 Cebollitas. All rights reserved.
//

import UIKit

struct ProductInformationViewModel {
    let elementName: String
    let elementDescription: String
}

protocol ProductInformationViewType: UIView {
    func setupComponent(with title: String, and elements: [ProductInformationViewModel])
}

final class ProductInformationView: UIView, ProductInformationViewType {
    private lazy var containerView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .white

        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var titleLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        view.numberOfLines = 0
        view.text = "No hay información adicional del producto."
        view.textAlignment = .center

        return view
    }()

    private lazy var verticalElementStackView: UIStackView = {
        let view = UIStackView(frame: .zero)
        view.backgroundColor = .white
        view.distribution = .fillEqually
        view.alignment = .fill
        view.spacing = 10
        view.axis = .vertical

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

    private func labelForTitle(_ title: String) -> UILabel {
        let view = UILabel(frame: .zero)
        view.font = UIFont.systemFont(ofSize: 12, weight: .light)
        view.textColor = .lightGray
        view.text = title
        view.textAlignment = .center

        return view
    }

    private func labelForDescription(_ description: String) -> UILabel {
        let view = UILabel(frame: .zero)
        view.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        view.numberOfLines = 0
        view.text = description
        view.textAlignment = .center

        return view
    }

    private func stackViewHorizontalForElement() -> UIStackView {
        let view = UIStackView(frame: .zero)
        view.backgroundColor = .white
        view.distribution = .fillEqually
        view.alignment = .fill
        view.spacing = 5
        view.axis = .horizontal

        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }

    private func initialSetup() {
        setupContainer()
        setupComponentStackView()
        setupTitle()
    }

    private func setupContainer() {
        addSubview(containerView)

        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }

    private func setupComponentStackView() {
        containerView.addSubview(verticalElementStackView)

        NSLayoutConstraint.activate([
            verticalElementStackView.topAnchor.constraint(equalTo: containerView.topAnchor),
            verticalElementStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            verticalElementStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            verticalElementStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
        ])
    }

    private func setupTitle() {
        verticalElementStackView.addArrangedSubview(titleLabel)
    }

    private func setupComponent(with viewModel: ProductInformationViewModel) {
        let horizontalElement = stackViewHorizontalForElement()

        horizontalElement.addArrangedSubview(labelForTitle(viewModel.elementName))
        horizontalElement.addArrangedSubview(labelForDescription(viewModel.elementDescription))
        verticalElementStackView.addArrangedSubview(horizontalElement)
    }

    func setupComponent(with title: String, and elements: [ProductInformationViewModel]) {
        guard !elements.isEmpty else { return }

        titleLabel.text = title

        elements.forEach { setupComponent(with: $0) }
    }
}
