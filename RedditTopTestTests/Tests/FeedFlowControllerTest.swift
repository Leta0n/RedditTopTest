//
//  FeedFlowControllerTest.swift
//  RedditTopTest
//
//  Created by Glib Pavliuchenko on 5/7/17.
//  Copyright © 2017 Glib Pavliuchenko. All rights reserved.
//

import XCTest
import SafariServices
@testable import RedditTopTest

class FeedFlowControllerTest: XCTestCase {
	
	var flowController: FeedFlowController!
	var viewController: UIViewControllerMock!
    
    override func setUp() {
        super.setUp()
		viewController = UIViewControllerMock()
        flowController = FeedFlowController(viewController)
    }
    
    override func tearDown() {
        flowController = nil
		viewController = nil
        super.tearDown()
    }
	
	func testRetainCycleAbsent() {
		viewController = nil
		XCTAssertNil(flowController.targetViewController)
	}
	
	func testPostSelection() {
		let post = Post(title: "1", author: "2", date: Date(),
		                commentsAmount: 3, thumbnailURL: nil, detailsURL: URL(string: "http://google.com")!)
		flowController.postSelected(post)
		XCTAssertNotNil(viewController.presentedViceController)
		XCTAssertTrue(viewController.presentedViceController is SFSafariViewController)
	}
	
	func testPostSelectionShouldNotPresentIfDetailsURLAbsent() {
		let post = Post(title: "1", author: "2", date: Date(),
		                commentsAmount: 3, thumbnailURL: nil, detailsURL: nil)
		flowController.postSelected(post)
		XCTAssertNil(viewController.presentedViceController)
	}
	
}
