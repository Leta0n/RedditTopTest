//
//  PostMapperTest.swift
//  RedditTopTest
//
//  Created by Glib Pavliuchenko on 5/7/17.
//  Copyright © 2017 Glib Pavliuchenko. All rights reserved.
//

import XCTest
@testable import RedditTopTest

class PostMapperTest: XCTestCase {
	
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
	
	func testPostMappingWithFulllDict() {
		let rawPost: [String: Any] = ["data":
			["title": "Title", "author": "Author", "created_utc": 1494181882 as Double, "num_comments": 99]]
		let post = PostMapper(element: rawPost)
		XCTAssertNotNil(post)
	}
	
	func testPostShouldNotBeMappedWithPartialData() {
		var rawPost: [String: Any] = ["data":
			["title": "Title", "created_utc": 1494181882 as Double, "num_comments": 99]]
		var post = PostMapper(element: rawPost)
		XCTAssertNil(post)
		
		rawPost = ["data":
		["author": "Author", "created_utc": 1494181882 as Double, "num_comments": 99]]
		post = PostMapper(element: rawPost)
		XCTAssertNil(post)
		
		rawPost = ["data":
		["title": "Title", "author": "Author", "num_comments": 99]]
		post = PostMapper(element: rawPost)
		XCTAssertNil(post)
		
		rawPost = ["data":
		["title": "Title", "author": "Author", "created_utc": 1494181882 as Double]]
		post = PostMapper(element: rawPost)
		XCTAssertNil(post)
	}
    
}
