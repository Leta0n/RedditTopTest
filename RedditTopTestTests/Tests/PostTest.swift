//
//  PostTest.swift
//  RedditTopTest
//
//  Created by Glib Pavliuchenko on 5/7/17.
//  Copyright © 2017 Glib Pavliuchenko. All rights reserved.
//

import XCTest
@testable import RedditTopTest

class PostTest: XCTestCase {
	
	var post: Post!
    
    override func setUp() {
        super.setUp()
		post = Post(title: "title", author: "author", date: Date(),
		            commentsAmount: 999, thumbnailURL: nil, detailsURL: nil)
	}
    
    override func tearDown() {
        post = nil
        super.tearDown()
    }
	
	func testDisplayableAuthor() {
		XCTAssertEqual(post.displayableAuthor(), "by author")
	}
	
	func testDisplayableComments() {
		XCTAssertEqual(post.displayableCommentsAmount(), "999 comments")
	}
	
	func testDisplayableDateMoreThen1HourAgo() {
		let calendar = Calendar.current
		var components = calendar.dateComponents([.day, .hour, .minute, .month, . year], from: Date())
		components.hour = components.hour! - 2
		let newDate = calendar.date(from: components)
		post = Post(title: "title", author: "author", date: newDate!,
		            commentsAmount: 999, thumbnailURL: nil, detailsURL: nil)
		XCTAssertEqual(post.displayableDate(), "2 hours ago")
	}
	
	func testDisplayableDateWithinHour() {
		post = Post(title: "title", author: "author", date: Date(),
		            commentsAmount: 999, thumbnailURL: nil, detailsURL: nil)
		XCTAssertEqual(post.displayableDate(), "just now")
	}
}
