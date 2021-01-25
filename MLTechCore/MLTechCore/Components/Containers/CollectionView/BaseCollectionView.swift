//
//  BaseCollectionView.swift
//  MLTechCore
//
//  Created by Sergio Giraldo on 24/01/21.
//  Copyright © 2021 Cebollitas. All rights reserved.
//

import UIKit

public typealias CollectionViewDataSource<T: SectionType> = UICollectionViewDiffableDataSource<T, T.DataType>

public protocol CollectionViewType: ContainerConfigurable, UICollectionViewDelegateFlowLayout {
    var collectionView: UICollectionView { get }
}

open class BaseCollectionView<T: SectionType, U: CellConfigurable>: CollectionViewDataSource<T>, CollectionViewType where T.DataType == U.DataType {
    private lazy var dataSource = makeDataSource()

    public var collectionView: UICollectionView
    public var sections: [T] = [] {
        didSet { updateDataSource() }
    }

    public init(collectionView: UICollectionView, sections: [T]) {
        self.collectionView = collectionView
        self.sections = sections
        super.init(collectionView: collectionView) { _, _, _ in nil }

        initialSetup()
    }

    private func makeDataSource() -> CollectionViewDataSource<T> {
        return UICollectionViewDiffableDataSource(collectionView: collectionView) { [unowned self] _, indexPath, _ in
            let cell: U = self.collectionView.dequeueReusableCell(for: indexPath)
            cell.configure(with: self.sections[indexPath.section].data[indexPath.row])

            return cell as? UICollectionViewCell
        }
    }

    private func initialSetup() {
        collectionView.register(U.self, forCellWithReuseIdentifier: U.reuseIdentifier)
        collectionView.delegate = self
        updateDataSource()
    }

    open func updateDataSource() {
        var snapshot = NSDiffableDataSourceSnapshot<T, T.DataType>()
        snapshot.appendSections(sections)
        sections.forEach { snapshot.appendItems($0.data) }

        DispatchQueue.main.async {
            self.dataSource.apply(snapshot, animatingDifferences: false)
        }
    }

    // MARK: - UICollectionViewDelegateFlowLayout methods.
    open func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        preconditionFailure("This function must be overriden")
    }

    open func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
