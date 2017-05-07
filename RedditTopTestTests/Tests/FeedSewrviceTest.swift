//
//  FeedSewrviceTest.swift
//  RedditTopTest
//
//  Created by Glib Pavliuchenko on 5/7/17.
//  Copyright © 2017 Glib Pavliuchenko. All rights reserved.
//

import XCTest
@testable import RedditTopTest

class FeedSewrviceTest: XCTestCase {
	
	var service: FeedService!
	var requestPerformer: RequestPerformerMock!
    
    override func setUp() {
        super.setUp()
		requestPerformer = RequestPerformerMock()
		service = FeedService(requestPerformer)
    }
    
    override func tearDown() {
        service = nil
		requestPerformer = nil
        super.tearDown()
    }
	
	func testfetchPost() {
		service.fetchPosts(limit: 999, nextLink: nil) { _ in }
		XCTAssertTrue(requestPerformer.methodWasCalled)
	}
}
