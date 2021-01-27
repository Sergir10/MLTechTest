//
//  UIImage+Extension.swift
//  MLTechCore
//
//  Created by Sergio Giraldo on 26/01/21.
//  Copyright © 2021 Cebollitas. All rights reserved.
//

import Kingfisher
import UIKit

public extension UIImageView {
    func downloadImage(from path: String, placeHolder: UIImage) {
        guard let url = URL(string: path) else {
            image = placeHolder
            return
        }

        KF.url(url)
            .showActivityIndicator(self)
            .cacheMemoryOnly()
            .fade(duration: 0.1)
            .onProgress { _, _ in
                self.kf.indicatorType = .activity
            }
            .onSuccess { _ in
                self.kf.indicatorType = .none
            }
            .set(to: self)
    }
}

private extension KF.Builder {
    func showActivityIndicator(_ image: UIImageView) -> Self {
        image.kf.indicatorType = .activity
        return self
    }
}
