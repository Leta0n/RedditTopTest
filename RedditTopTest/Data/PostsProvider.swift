//
//  PostsProvider.swift
//  RedditTopTest
//
//  Created by Glib Pavliuchenko on 5/6/17.
//  Copyright © 2017 Glib Pavliuchenko. All rights reserved.
//

import Foundation

class PostsProvider: ListingDataProvider {

	typealias ItemType = Post
	
	// MARK: - Dependencies
	
	private var feedService: FeedService
	
	// MARK: - Initialization
	
	init(_ service: FeedService) {
		feedService = service
	}
	
	// MARK: - Accessor
	
	func dataArray(with pagination: PaginationInfo, completion: @escaping ([Post]) -> Void) {
		feedService.fetchPosts { posts in
			completion(posts)
		}
	}
}
