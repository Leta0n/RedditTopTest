//
//  UIImageView+Cache.swift
//  RedditTopTest
//
//  Created by Glib Pavliuchenko on 5/6/17.
//  Copyright © 2017 Glib Pavliuchenko. All rights reserved.
//

import UIKit

var URlObjectKey: String = "imageURL"
extension UIImageView {
	func setImage(from url: URL) {
		objc_setAssociatedObject(self, &URlObjectKey, url, .OBJC_ASSOCIATION_COPY_NONATOMIC)
		ImageLoader.sharedLoader?.loadImage(with: url) { [weak self] image, imageURL in
			guard let strongSelf = self else { return }
			if let previousURL = objc_getAssociatedObject(strongSelf, &URlObjectKey) as? URL {
				if previousURL.absoluteString == imageURL.absoluteString {
					strongSelf.image = image
				}
			}
		}
	}
}
