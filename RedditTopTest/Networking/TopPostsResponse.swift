//
//  TopPostsEndpointResponse.swift
//  RedditTopTest
//
//  Created by Glib Pavliuchenko on 5/6/17.
//  Copyright © 2017 Glib Pavliuchenko. All rights reserved.
//

import Foundation

struct TopPostsResponse: RequestResponse {
	
	var posts: [Post] = []
	
	init?(_ data: Data) {
		guard let parsedObject = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) else { return nil }
		guard let json = parsedObject as? [String: Any] else { return nil }
		guard let data = json["data"] as? [String: Any] else { return nil }
		guard let rawPosts = data["children"] as? [[String: Any]] else { return nil }
		posts.append(contentsOf: rawPosts.map { PostMapper(element: $0) }.flatMap { $0 })
	}
}

func PostMapper(element: [String: Any]) -> Post? {
	guard let data = element["data"] as? [String: Any] else { return nil }
	guard let title = data["title"] as? String else { return nil }
	guard let author = data["author"] as? String else { return nil }
	guard let timeshtamp = data["created_utc"] as? Double else { return nil }
	guard let comments = data["num_comments"] as? Int else { return nil }
	
	var thumbnailURL: URL?
	var url: URL?
	
	if let thumbnailURLString = data["thumbnail"] as? String {
		thumbnailURL = URL(string: thumbnailURLString)
	}
	
	if let urlString = data["url"] as? String {
		url = URL(string: urlString)
	}
	
	let date = Date(timeIntervalSince1970: timeshtamp)
	
	let post = Post(title: title, author: author, date: date,
	                commentsAmount: comments, thumbnailURL: thumbnailURL, detailsURL: url)
	return post
}
