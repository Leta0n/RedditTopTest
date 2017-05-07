//
//  EndpointMock.swift
//  RedditTopTest
//
//  Created by Glib Pavliuchenko on 5/6/17.
//  Copyright © 2017 Glib Pavliuchenko. All rights reserved.
//

import Foundation
@testable import RedditTopTest

struct EndpointMock: Endpoint {
	typealias Response = ResponseMock
	var path: String = "/search"
	var parameters: [String : Any] = ["q": "how+to+create+app+for+ios"]
}

struct ResponseMock: RequestResponse {
	init(_ data: Data) {
		
	}
}
