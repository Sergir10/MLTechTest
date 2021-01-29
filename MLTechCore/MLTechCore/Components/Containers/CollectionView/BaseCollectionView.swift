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

private struct Constants {
    static let footerElementKind = "footerElementKind"
}

open class BaseCollectionView<T: SectionType, U: CellConfigurable>: CollectionViewDataSource<T>, CollectionViewType where T.DataType == U.DataType {
    private lazy var dataSource = makeDataSource()
    private var isLoadMoreHidden: Bool

    public weak var delegate: CollectionViewDelegate?
    public var collectionView: UICollectionView
    public var sections: [T] = [] {
        didSet { updateDataSource() }
    }

    public init(collectionView: UICollectionView, sections: [T], delegate: CollectionViewDelegate? = nil, isLoadMoreHidden: Bool = true) {
        self.collectionView = collectionView
        self.sections = sections
        self.delegate = delegate
        self.isLoadMoreHidden = isLoadMoreHidden
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

    private func setupSuplementaryView() {
        dataSource.supplementaryViewProvider = { (collectionView: UICollectionView, kind: String, indexPath: IndexPath) -> UICollectionReusableView? in
            if let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: LoadMoreSupplementaryView.reuseIdentifier, for: indexPath) as? LoadMoreSupplementaryView {
                self.delegate?.loadMore()
                return footerView
            }

            preconditionFailure()
        }
    }

    private func setupFooter() {
        guard !isLoadMoreHidden else {
            return
        }

        setupSuplementaryView()
        collectionView.collectionViewLayout = createLayout()
    }

    private func initialSetup() {
        collectionView.register(U.self, forCellWithReuseIdentifier: U.reuseIdentifier)
        collectionView.register(LoadMoreSupplementaryView.self, forSupplementaryViewOfKind: Constants.footerElementKind, withReuseIdentifier: LoadMoreSupplementaryView.reuseIdentifier)
        collectionView.delegate = self

        setupFooter()
        updateDataSource()
    }

    private func createLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(100))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

        let footerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(50))
        let footer = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: footerSize, elementKind: Constants.footerElementKind, alignment: .bottom)

        let section = NSCollectionLayoutSection(group: group)
        section.boundarySupplementaryItems = [footer]
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }

    open func updateDataSource() {
        var snapshot = NSDiffableDataSourceSnapshot<T, T.DataType>()
        snapshot.appendSections(sections)
        sections.forEach { snapshot.appendItems($0.data, toSection: $0) }

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

    open func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didSelectItem(at: indexPath)
    }

    open func scrollViewDidScroll(_: UIScrollView) {}
}
