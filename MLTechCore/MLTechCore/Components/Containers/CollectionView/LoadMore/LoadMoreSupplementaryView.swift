//
//  LoadMoreSupplementaryView.swift
//  MLTechCore
//
//  Created by Sergio Giraldo on 28/01/21.
//  Copyright © 2021 Cebollitas. All rights reserved.
//

import UIKit

final class LoadMoreSupplementaryView: UICollectionReusableView, CellReusable {
    lazy var activityIndicatorView: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(frame: .zero)

        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: .zero)
        initialSetup()
        activityIndicatorView.startAnimating()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func initialSetup() {
        addSubview(activityIndicatorView)

        NSLayoutConstraint.activate([
            activityIndicatorView.centerXAnchor.constraint(equalTo: centerXAnchor),
            activityIndicatorView.centerYAnchor.constraint(equalTo: centerYAnchor),
            activityIndicatorView.heightAnchor.constraint(equalToConstant: 30),
        ])
    }
}
