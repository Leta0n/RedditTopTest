//
//  ImageLoader.swift
//  RedditTopTest
//
//  Created by Glib Pavliuchenko on 5/6/17.
//  Copyright © 2017 Glib Pavliuchenko. All rights reserved.
//

import UIKit

class ImageLoader {
	
	private let queue: DispatchQueue
	private let cache: NSCache<NSURL, UIImage>
	init(_ queue: DispatchQueue, cache: NSCache<NSURL, UIImage>) {
		self.queue = queue
		self.cache = cache
	}
	
	func loadImage(with url: URL, completion: @escaping (UIImage, URL) -> Void) {
		queue.async { [weak self] in
			if let cachedImage = self?.cache.object(forKey: url as NSURL) {
				DispatchQueue.main.async {
					completion(cachedImage, url)
				}
			} else {
				guard let data = try? Data(contentsOf: url) else { return }
				guard let image = UIImage(data: data) else { return }
				self?.cache.setObject(image, forKey: url as NSURL)
				DispatchQueue.main.async {
					completion(image, url)
				}
			}
		}
	}
}

extension ImageLoader {
	static var sharedLoader: ImageLoader?
}
