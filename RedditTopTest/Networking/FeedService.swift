//
//  PostsService.swift
//  RedditTopTest
//
//  Created by Glib Pavliuchenko on 5/6/17.
//  Copyright © 2017 Glib Pavliuchenko. All rights reserved.
//

import Foundation

final class FeedService {
	private let networkSession: NetworkSession
	
	init(_ session: NetworkSession) {
		networkSession = session
	}
	
	func fetchPosts(limit: Int, nextLink: String?,
	                completion: @escaping ((Result<(posts: [Post], nextLink: String?)>)) -> Void) {
		let endpont = GetTopPostsEndpoint(limit, nextLink: nextLink)
		networkSession.performRequest(from: endpont, completion: { result in
			DispatchQueue.main.sync {
				switch result {
				case .success(let response):
					completion(Result.success(value: (response.posts, response.nextLink)))
				case .failure():
					completion(Result.failure())
				}
			}
		})
	}
}
