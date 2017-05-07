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
	
	private var feedService: PostsFetcher
	
	// MARK: - Properties
	
	var loading: Bool = false
	let fetchLimit: Int
	var nextLink: String?
	
	// MARK: - Initialization
	
	init(_ service: PostsFetcher, fetchLimit: Int) {
		feedService = service
		self.fetchLimit = fetchLimit
	}
	
	// MARK: - Accessor
	
	func initialFetch(completion: @escaping ([ItemType]) -> Void) {
		fetch(nextLink: nil) { posts in
			completion(posts)
		}
	}
	
	func fetchMore(completion: @escaping ([ItemType]) -> Void) {
		fetch(nextLink: nextLink) { posts in
			completion(posts)
		}
	}
	
	// MARK: - Private
	
	private func fetch(nextLink: String?, completion: @escaping ([ItemType]) -> Void) {
		loading = true
		feedService.fetchPosts(limit: fetchLimit, nextLink: nextLink) { [weak self] result in
			guard let strongSelf = self else { return }
			switch result {
			case .success(let value):
				completion(value.posts)
				strongSelf.nextLink = value.nextLink
				fallthrough
			case .failure():
				strongSelf.loading = false
			}
		}
	}
}
