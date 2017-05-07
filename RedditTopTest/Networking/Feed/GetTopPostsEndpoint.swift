//
//  GetTopPostsEndpoint.swift
//  RedditTopTest
//
//  Created by Glib Pavliuchenko on 5/6/17.
//  Copyright © 2017 Glib Pavliuchenko. All rights reserved.
//

import Foundation

/// Represents Reddit api request for top posts. Details - https://www.reddit.com/dev/api
struct GetTopPostsEndpoint: Endpoint {
	typealias Response = TopPostsResponse
	let parameters: [String : Any]
	var path: String = "/r/all/top.json"
	
	/// - parameter limit: The maximum number of items to return in this slice of the listing.
	/// - parameter count: The number of items already seen in this listing.
	init(_ limit: Int, nextLink: String?) {
		var params: [String: Any] = [:]
		params["limit"] = limit
		if let after = nextLink {
			params["after"] = after
		}
		parameters = params
	}
}
