//
//  PostProviderTest.swift
//  RedditTopTest
//
//  Created by Glib Pavliuchenko on 5/7/17.
//  Copyright © 2017 Glib Pavliuchenko. All rights reserved.
//

import XCTest
@testable import RedditTopTest

class PostProviderTest: XCTestCase {
	
	var postProvider: PostsProvider!
	var postFetcher: PostFetcherMock!
	
    override func setUp() {
        super.setUp()
		postFetcher = PostFetcherMock()
        postProvider = PostsProvider(postFetcher, fetchLimit: 999)
    }
    
    override func tearDown() {
		postProvider = nil
		postFetcher = nil
		super.tearDown()
    }
	
	func testLoadintStateAfterInitialFetch() {
		postProvider.initialFetch(completion: { _ in
			
		})
		XCTAssertTrue(postProvider.loading)
	}
	
	func testLoadintStateAfterNextFetch() {
		postProvider.fetchMore(completion: { _ in
			
		})
		XCTAssertTrue(postProvider.loading)
	}
	
	func testInitialFetchShouldbeWithoutNextLink() {
		postProvider.initialFetch(completion: {_ in })
		XCTAssertNil(postFetcher.requestedNextLink)
	}
	
	func testFetchMoreShouldContainNextLink() {
		postProvider.nextLink = "NextLink"
		postProvider.fetchMore(completion: {_ in })
		XCTAssertEqual(postFetcher.requestedNextLink, "NextLink")
	}
	
	func testRequestedFetchLimit() {
		postProvider.initialFetch(completion: {_ in })
		XCTAssertEqual(postFetcher.requestedFetchLimit, 999)
		
		postProvider.fetchMore(completion: {_ in })
		XCTAssertEqual(postFetcher.requestedFetchLimit, 999)
	}
}
