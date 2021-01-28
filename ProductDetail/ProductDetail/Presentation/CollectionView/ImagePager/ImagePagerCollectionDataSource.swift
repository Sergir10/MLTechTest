//
//  ImagePagerCollectionDataSource.swift
//  ProductDetail
//
//  Created by Sergio Giraldo on 27/01/21.
//  Copyright © 2021 Cebollitas. All rights reserved.
//

import MLTechCore
import UIKit

final class ImagePagerDataSource: BaseCollectionView<ImagePagerSectionViewModel, ImagePagerCollectionViewCell> {
    private var pagerControl: UIPageControl

    init(collectionView: UICollectionView, pagerControl: UIPageControl, sections: [ImagePagerSectionViewModel]) {
        self.pagerControl = pagerControl
        super.init(collectionView: collectionView, sections: sections)
    }

    override func updateDataSource() {
        super.updateDataSource()
        pagerControl.numberOfPages = sections.first?.data.count ?? 0
    }

    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height)
    }

    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let translation = scrollView.panGestureRecognizer.translation(in: scrollView.superview)
        var currentIndex: CGFloat = collectionView.contentOffset.x / collectionView.frame.size.width

        if currentIndex.isNaN { currentIndex = 0 }
        if translation.x < 0 { currentIndex = currentIndex.rounded(.up) }

        pagerControl.currentPage = Int(currentIndex)
    }
}
