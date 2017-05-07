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
	
	func fetchPosts(with pagination: PaginationInfo, completion: @escaping (Result<[Post]>) -> Void) {
		let endpont = GetTopPostsEndpoint(pagination.limit, count: pagination.offset)
		networkSession.performRequest(from: endpont, completion: { result in
			DispatchQueue.main.sync {
				switch result {
				case .success(let response):
					completion(Result.success(value: response.posts))
				case .failure():
					completion(Result.failure())
				}
			}
		})
	}
}
