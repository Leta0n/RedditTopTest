//
//  URLSessionMock.swift
//  RedditTopTest
//
//  Created by Glib Pavliuchenko on 5/6/17.
//  Copyright © 2017 Glib Pavliuchenko. All rights reserved.
//

import Foundation

class URLSessionMock: URLSession {
	override func dataTask(with url: URL,
	                       completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
		return URLSessionDataTaskMock()
	}
}
