//
//  PostsProviderMock.swift
//  RedditTopTest
//
//  Created by Glib Pavliuchenko on 5/7/17.
//  Copyright © 2017 Glib Pavliuchenko. All rights reserved.
//

import Foundation
@testable import RedditTopTest

class PostFetcherMock: PostsFetcher {
	var requestedFetchLimit: Int = 0
	var requestedNextLink: String?
	func fetchPosts(limit: Int, nextLink: String?,
	                completion: @escaping ((Result<(posts: [Post], nextLink: String?)>)) -> Void) {
		requestedFetchLimit = limit
		requestedNextLink = nextLink
	}
}
