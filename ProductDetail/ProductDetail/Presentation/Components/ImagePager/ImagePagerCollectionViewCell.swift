//
//  ImagePagerCollectionViewCell.swift
//  ProductDetail
//
//  Created by Sergio Giraldo on 27/01/21.
//  Copyright © 2021 Cebollitas. All rights reserved.
//

import MLTechCore
import UIKit

final class ImagePagerCollectionViewCell: UICollectionViewCell, CellConfigurable {
    typealias DataType = ImagePagerCellViewModel

    lazy var productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .clear
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.tintColor = .white

        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    lazy var containerView: UIStackView = {
        let view = UIStackView(frame: .zero)
        view.alignment = .fill
        view.distribution = .fill
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

    override func awakeFromNib() {
        fatalError("Interface builder has not been implemented")
    }

    private func initialSetup() {
        setupContainerView()
        setupProductImageView()
    }

    private func setupContainerView() {
        contentView.addSubview(containerView)

        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }

    private func setupProductImageView() {
        containerView.addSubview(productImageView)

        NSLayoutConstraint.activate([
            productImageView.topAnchor.constraint(equalTo: containerView.topAnchor),
            productImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            productImageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            productImageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
        ])
    }

    func configure(with data: ImagePagerCellViewModel) {
        productImageView.downloadImage(from: data.imageURL, placeHolder: UIImage())
    }
}
