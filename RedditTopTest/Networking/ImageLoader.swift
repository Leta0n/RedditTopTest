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
	
	init(_ queue: DispatchQueue) {
		self.queue = queue
	}
	
	func loadImage(with url: URL, completion: @escaping (UIImage, URL) -> Void) {
		queue.async {
			guard let data = try? Data(contentsOf: url) else { return }
			guard let image = UIImage(data: data) else { return }
			DispatchQueue.main.async {
				completion(image, url)
			}
		}
	}
}

extension ImageLoader {
	static var sharedLoader: ImageLoader?
}
