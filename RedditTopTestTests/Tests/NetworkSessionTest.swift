//
//  RedditTopTestTests.swift
//  RedditTopTestTests
//
//  Created by Glib Pavliuchenko on 5/6/17.
//  Copyright © 2017 Glib Pavliuchenko. All rights reserved.
//

import XCTest
@testable import RedditTopTest

class NetworkSessionTest: XCTestCase {
	
	var session: NetworkSession!
	let serverURLString = "https://www.google.com.ua"
    
    override func setUp() {
        super.setUp()
		guard let serverURL = URL(string: serverURLString) else { return }
		session = NetworkSession(URLSessionMock(), baseServerURL: serverURL)
    }
    
    override func tearDown() {
		session = nil
		super.tearDown()
    }
    
    func testURLAssembly() {
		let endpoint = EndpointMock()
        let requestURL = session.requestURL(with: endpoint)!
		
		XCTAssertEqual(requestURL.absoluteString.removingPercentEncoding!,
		               "https://www.google.com.ua/search?q=how+to+create+app+for+ios")
    }
	
	func testPerformRequestCancelsPreviousRequest() {
		let endpoint = EndpointMock()
		session.performRequest(from: endpoint, completion: { _ in
			print("")
		})
		let datatask1 = session.currentDataTask!
		session.performRequest(from: endpoint, completion: { _ in
			print("")
		})
		if let mockedDataTask = datatask1 as? URLSessionDataTaskMock {
			XCTAssertTrue(mockedDataTask.canceled)
		}
	}
}
