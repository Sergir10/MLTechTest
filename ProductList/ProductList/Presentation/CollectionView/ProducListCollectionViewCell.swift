//
//  ProducListCollectionViewCell.swift
//  ProductList
//
//  Created by Sergio Giraldo on 24/01/21.
//  Copyright © 2021 Cebollitas. All rights reserved.
//

import MLTechCore
import UIKit

final class ProducListCollectionViewCell: UICollectionViewCell, CellConfigurable {
    typealias DataType = ProducListCellViewModel

    private lazy var mainStackView: UIStackView = {
        let view = UIStackView(frame: .zero)
        view.alignment = .fill
        view.distribution = .fillProportionally
        view.spacing = 10
        view.axis = .horizontal

        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var imageContainerView: UIView = {
        let view = UIView(frame: .zero)

        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var productImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.backgroundColor = .clear
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.tintColor = .white

        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var descriptionStackView: UIStackView = {
        let view = UIStackView(frame: .zero)
        view.alignment = .leading
        view.distribution = .fillEqually
        view.spacing = 5
        view.axis = .vertical

        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 0
        label.textColor = .black
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont.systemFont(ofSize: 14, weight: .light)

        return label
    }()

    private lazy var priceLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 0
        label.textColor = .black
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)

        return label
    }()

    private lazy var shippingLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 0
        label.textColor = .systemGreen
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont.systemFont(ofSize: 12, weight: .light)

        return label
    }()

    private lazy var quantityLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 0
        label.textColor = .black
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont.systemFont(ofSize: 14, weight: .light)

        return label
    }()

    private lazy var lineSeparatorView: UIView = {
        let view = UIView(frame: .zero)
        view.heightAnchor.constraint(equalToConstant: 1).isActive = true
        view.backgroundColor = .lightGray

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

    override func awakeFromNib() {
        fatalError("Interface builder has not been implemented")
    }

    private func initialSetup() {
        contentView.addSubview(mainStackView)

        setupSeparatorView()
        setupMainStackView()
        setupImageContainer()
        setupDescriptionContainer()
    }

    private func setupMainStackView() {
        mainStackView.addArrangedSubview(imageContainerView)
        mainStackView.addArrangedSubview(descriptionStackView)

        NSLayoutConstraint.activate([
            imageContainerView.widthAnchor.constraint(equalToConstant: 100),

            mainStackView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 5),
            mainStackView.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: lineSeparatorView.bottomAnchor, constant: -10),
        ])
    }

    private func setupSeparatorView() {
        contentView.addSubview(lineSeparatorView)

        NSLayoutConstraint.activate([
            lineSeparatorView.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor),
            lineSeparatorView.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor),
            lineSeparatorView.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor),
        ])
    }

    private func setupImageContainer() {
        imageContainerView.addSubview(productImageView)

        NSLayoutConstraint.activate([
            productImageView.topAnchor.constraint(equalTo: imageContainerView.topAnchor),
            productImageView.bottomAnchor.constraint(equalTo: imageContainerView.bottomAnchor),
            productImageView.leadingAnchor.constraint(equalTo: imageContainerView.leadingAnchor),
            productImageView.trailingAnchor.constraint(equalTo: imageContainerView.trailingAnchor),
        ])
    }

    private func setupDescriptionContainer() {
        descriptionStackView.addArrangedSubview(titleLabel)
        descriptionStackView.addArrangedSubview(priceLabel)
        descriptionStackView.addArrangedSubview(shippingLabel)
        descriptionStackView.addArrangedSubview(quantityLabel)
    }

    func configure(with data: ProducListCellViewModel) {
        titleLabel.text = data.title
        priceLabel.text = NSNumber(integerLiteral: data.price).toLocalCurrency() ?? "$\(data.price)"
        shippingLabel.text = data.freeShipping ? "Envio Gratis." : "Costo asociado de envio."
        quantityLabel.text = "Unidades disponibles: \(data.availableQuantity)"
        productImageView.downloadImage(from: data.thumbnail, placeHolder: UIImage())
    }
}
