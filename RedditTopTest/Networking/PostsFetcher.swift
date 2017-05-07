//
//  PostsFetcher.swift
//  RedditTopTest
//
//  Created by Glib Pavliuchenko on 5/7/17.
//  Copyright © 2017 Glib Pavliuchenko. All rights reserved.
//

import Foundation

protocol PostsFetcher {
	func fetchPosts(limit: Int, nextLink: String?,
	                completion: @escaping ((Result<(posts: [Post], nextLink: String?)>)) -> Void)
}
