//
//  URLSessionDataTaskMock.swift
//  RedditTopTest
//
//  Created by Glib Pavliuchenko on 5/6/17.
//  Copyright © 2017 Glib Pavliuchenko. All rights reserved.
//

import Foundation

class URLSessionDataTaskMock: URLSessionDataTask {
	var canceled: Bool = false
	override func cancel() {
		canceled = true
	}
}
