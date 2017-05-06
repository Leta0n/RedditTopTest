//
//  GetTopPostsEndpoint.swift
//  RedditTopTest
//
//  Created by Glib Pavliuchenko on 5/6/17.
//  Copyright © 2017 Glib Pavliuchenko. All rights reserved.
//

import Foundation

struct GetTopPostsEndpoint: Endpoint {
	typealias Response = TopPostsResponse
	let parameters: [String : Any]
	var path: String = "/r/all/top.json"

	init(_ limit: Int, count: Int) {
		parameters = ["limit": limit, "count": count]
	}
}
